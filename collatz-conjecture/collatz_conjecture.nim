proc steps*(number: int): int =
    var num = number
    if number < 1:
        raise newException(ValueError, "invalid number")

    while num > 1:
        if (num and 1) == 0:
            num = num shr 1
            result.inc
        else:
            num = num * 3 + 1
            result.inc