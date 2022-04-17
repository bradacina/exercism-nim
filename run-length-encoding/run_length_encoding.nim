import parseutils, strutils

proc encode*(input:string): string =
    if input.len == 0:
        return ""

    var count = 1
    var character = input[0]

    for i in 1..<input.len:
        if input[i] == character:
            count+=1
        else:
            result = result & (if count > 1: $count else: "") & character
            character = input[i]
            count = 1
    
    if count > 0:
        result = result & (if count > 1: $count else: "") & character


proc decode*(input:string): string =
    var i = 0;
    while i < input.len:
        var number: int
        var scanned = parseInt(input, number, i)

        if scanned == 0:
            result = result & input[i]
        else:
            i = i + scanned
            result = result & input[i].repeat(number)

        i.inc
