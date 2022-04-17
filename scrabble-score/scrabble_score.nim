from tables import newTable, add, `[]`
from sequtils import foldl
from strutils import toUpperAscii

let score_table = newTable[char,int]()

discard foldl("AEIOULNRST", (add(a, b, 1); a), score_table)
discard foldl("DG", (add(a, b, 2); a), score_table)
discard foldl("BCMP", (add(a, b, 3); a), score_table)
discard foldl("FHVWY", (add(a, b, 4); a), score_table)
discard foldl("K", (add(a, b, 5); a), score_table)
discard foldl("JX", (add(a, b, 8); a), score_table)
discard foldl("QZ", (add(a, b, 10); a), score_table)

proc score*(word: string): int =
    result = foldl(word.toUpperAscii, (a + score_table[b]), 0)