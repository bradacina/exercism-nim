import strutils

proc is_shouting(message:string): bool =
    message == message.toUpperAscii and message.find(Letters) != -1

proc is_question(message:string): bool =
    var trimmed = message.strip(trailing=true, chars= {' '})
    trimmed[trimmed.len-1] == '?'

proc is_silence(message:string): bool =
    message.len == 0 or message.isSpaceAscii

proc hey*(message:string): string =
    if is_silence(message):
        "Fine. Be that way!"
    elif is_shouting(message) and is_question(message):
        "Calm down, I know what I'm doing!"
    elif is_shouting(message):
        "Whoa, chill out!"
    elif is_question(message):
        "Sure."
    else:
        "Whatever."
