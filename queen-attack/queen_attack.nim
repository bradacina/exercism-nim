
type Coords = tuple[rank, file: int]

proc checkValidCoordinates(white, black: Coords)=
    if white.rank < 0 or white.rank > 7 or
        white.file < 0 or white.file > 7 or
        black.rank < 0 or black.rank > 7 or
        black.file < 0 or black.file > 7:
            raise newException(ValueError, "Invalid board position")

    if white.rank == black.rank and white.file == black.file:
        raise newException(ValueError, "Invalid board position")

proc board*(white, black: Coords): seq[string] =
    checkValidCoordinates(white,black)

    for rank in 0..7:
        var row = ""
        for file in 0..7:
            if rank == white.rank and file == white.file:
                row.add("W")
                continue
            if rank == black.rank and file == black.file:
                row.add("B")
                continue
            row.add("_")
        result.add(row)

proc canAttack*(white, black: Coords): bool =
    checkValidCoordinates(white, black)

    white.rank == black.rank or white.file == black.file or
        abs(white.rank - black.rank) == abs(white.file - black.file)
    