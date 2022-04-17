from sequtils import toSeq, deduplicate
from math import sum

type FactorsAndUpperBound = tuple
    factors: seq[int]
    upperBound: int

type SingleFactorAndBound = tuple
    factor: int
    upperBound: int

iterator multiplesOf(fub: SingleFactorAndBound): int {.inline.} =
    if fub.factor > 0:
        for i in 1..<fub.upperBound:
            let multiple = fub.factor * i
            if multiple < fub.upperBound:
                yield multiple
            else:
                break

iterator multiplesOfFactors(fub: FactorsAndUpperBound): int {.inline} =
    for f in fub.factors:
        for m in (f, fub.upperBound).multiplesOf:
            yield m

proc sum*(lessThan: int, factors: openarray[int]): int =
    var fub: FactorsAndUpperBound = (toSeq(factors.items), lessThan)
    var multiples = toSeq(fub.multiplesOfFactors).deduplicate
    sum(multiples)