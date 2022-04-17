import strutils

type CharSet = set[char]

proc isIsogram*(word: string): bool =
    let lowerCaseWord = word.toLowerAscii
    var seen: CharSet

    for letter in lowerCaseWord.items:
        if letter == '-' or letter == ' ':
            continue

        if letter in seen:
            return false
        else:
            seen = seen + {letter}

    return true