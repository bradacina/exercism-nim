import strutils

type CharSet = set[char]

let alphabet: CharSet = {'a'..'z'}

proc isPangram*(word: string): bool =
    let lowerCaseWord = word.toLowerAscii
    var seen: CharSet

    for letter in lowerCaseWord.items:
        seen = seen + {letter}

    return alphabet <= seen