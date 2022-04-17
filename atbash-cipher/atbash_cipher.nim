from strutils import toLowerAscii, wordWrap, replace

proc init(): array['a'..'z', char] =
    for idx in 'a'..'z':
        result[idx] = ('z'.uint8 + 'a'.uint8 - idx.uint8).char

const cypher = init()

proc encode*(message:string): string =
    var message = message.toLowerAscii
    for letter in message:
        case letter
        of {'a'..'z'}:
            result &= cypher[letter]
        of {'0'..'9'}:
            result &= letter
        else: 
            continue
    
    return result.wordWrap(maxLineWidth=5, newLine=" ")

proc decode*(message:string): string =
    encode(message).replace(" ", "")