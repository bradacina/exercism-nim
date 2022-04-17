proc squareOfSum*(num: int): int=
    var sum = 0;
    for i in 1..num:
        sum += i
    
    return sum * sum

proc sumOfSquares*(num:int): int=
    for i in 1..num:
        result += (i * i)

proc difference*(num:int): int=
    squareOfSum(num) - sumOfSquares(num)