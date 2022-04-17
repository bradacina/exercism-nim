from tables import CountTableRef, newCountTable, getOrDefault
from sequtils import toSeq

proc count*(nucleotide: char, dna: string): int =
    var countTable = newCountTable(toSeq(dna.items))
    return countTable.getOrDefault(nucleotide, 0)

proc countDna*(dna: string): CountTableRef[char] =
    result = newCountTable(toSeq(dna.items))
    