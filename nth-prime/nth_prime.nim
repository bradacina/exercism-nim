proc isPrime(number: int): bool =
    if number <= 3:
        return number > 1
    elif number mod 2 == 0 or number mod 3 == 0:
        return false
    var i = 5
    while i * i <= number:
        if number mod i == 0 or number mod (i + 2) == 0:
            return false
        i = i + 6
    return true

proc prime*(n:int): int =
    if n <= 0:
        raise newException(ValueError, "no 0th prime")
    
    var found = 0
    var candidate = 1
    while found < n:
        candidate.inc
        if isPrime(candidate):
            found.inc

    candidate        