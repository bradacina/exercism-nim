import tables

type 
    Allergies* = object
        items: seq[string]

const allergies_map = {
    1: "eggs",
    2: "peanuts",
    4: "shellfish",
    8: "strawberries",
    16: "tomatoes",
    32: "chocolate",
    64: "pollen",
    128: "cats"
}.toOrderedTable

proc determineAllergies(score:int): seq[string] =
    for k,v in allergies_map.pairs:
        if (score and k) != 0:
            result.add(v)

proc initAllergies*(score: int): Allergies =
    Allergies(items: determineAllergies(score))

proc isAllergicTo*(allergies: Allergies, something: string): bool =
    something in allergies.items

proc lst*(allergies: Allergies): seq[string] =
    allergies.items    