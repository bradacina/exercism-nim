proc binary*(binary:string): int =
    for ch in binary:
        if ch != '0' and ch != '1':
            raise newException(ValueError, "Not valid binary")
        result = result * 2 + (if ch == '1': 1 else: 0)