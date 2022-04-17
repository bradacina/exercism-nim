from sequtils import keepIf, toSeq
from tables import newTable, TableRef, values, add, clear, len, contains

type
    Cell* = ref object of RootObj
        value: int
        computes: seq[ComputeCell]
        reactor: Reactor

    ComputeCell = ref object of Cell
        id: int # helps identify which cells need to call their callback
        formula: CellFormula
        inputs: seq[Cell]
        callbacks: seq[CallbackProc]

    Reactor = ref object
        steadyStateCallbacks: TableRef[int, SteadyStateCallback]
        nextCellId: int

    CellFormula = proc (vals: seq[int]):int

    CallbackProc = proc (val: int)

    SteadyStateCallback = tuple[cell: ComputeCell, oldValue: int]


proc cellValues(cells: openArray[Cell]): seq[int] =
    for cell in cells:
        result.add(cell.value)


proc nextCellId(reactor: Reactor): int {.noinit} =
    reactor.nextCellId.inc
    reactor.nextCellId


proc addSteadyStateCallbacks(reactor: Reactor, cell: ComputeCell) =
    if reactor.steadyStateCallbacks.contains(cell.id):
        return

    reactor.steadyStateCallbacks.add(cell.id, (cell, cell.value))


proc runSteadyStateCallbacks(reactor: Reactor) =
    if reactor.steadyStateCallbacks.len == 0:
        return

    for ssCallback in reactor.steadyStateCallbacks.values:
        if ssCallback.oldValue == ssCallback.cell.value:
            continue

        for callback in ssCallback.cell.callbacks:
            callback(ssCallback.cell.value)
    
    reactor.steadyStateCallbacks.clear
    

proc recompute(cell: ComputeCell) {.noinit} =
    if cell.callbacks.len != 0:
        cell.reactor.addSteadyStateCallbacks(cell)
    
    let oldVal = cell.value
    cell.value = cell.formula(cell.inputs.cellValues)

    if oldVal == cell.value:
        return

    for computeCell in cell.computes:
        computeCell.recompute


proc `value=`*(cell: Cell, newVal: int) {.noinit} =
    cell.value = newVal

    for computeCell in cell.computes:
        computeCell.recompute

    cell.reactor.runSteadyStateCallbacks


method value*(cell: Cell): int {.base}=
    cell.value


proc newReactor*(): Reactor {.noinit} =
    Reactor(steadyStateCallbacks: newTable[int, SteadyStateCallback]())


proc createInput*(reactor: Reactor, value: int): Cell {.noinit} =
    Cell(value: value, reactor: reactor)


proc createCompute*(reactor: Reactor, inputs: openArray[Cell], formula: CellFormula): ComputeCell {.noinit} =
    result = ComputeCell(
        id: nextCellId(reactor),
        value: formula(inputs.cellValues), 
        formula: formula,
        inputs: toSeq(inputs.items),
        reactor: reactor)

    for input in inputs:
        input.computes.add(result)


proc addCallback*(cell: ComputeCell, callback: CallbackProc): CallbackProc {.noinit}=
    cell.callbacks.add(callback)
    callback


proc removeCallback*(cell: ComputeCell, callback: CallbackProc) =
    cell.callbacks.keepIf(proc(x:CallbackProc): bool = x != callback)