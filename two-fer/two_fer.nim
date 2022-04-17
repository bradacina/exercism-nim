import strformat

proc two_fer*(name = "you"):string =
    return &"One for {name}, one for me."