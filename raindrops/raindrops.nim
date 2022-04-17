proc convert*(number: uint): string =
    if number mod 3 == 0:
        result &= "Pling"

    if number mod 5 == 0:
        result &= "Plang"

    if number mod 7 == 0:
        result &= "Plong"

    if result.len == 0:
        return $number