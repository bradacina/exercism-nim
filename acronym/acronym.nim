import strutils

proc abbreviate*(phrase:string): string=
    for word in phrase.split({' ','-'}):
        result &= word[0].toUpperAscii