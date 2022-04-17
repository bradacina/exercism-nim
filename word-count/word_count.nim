import tables
import strutils

const punctuation = {',', '!', '&', '$', '%', '^', ':', '"', '@', '.'}

proc countWords*(sentence: string): TableRef[string,int] =
    result = newTable[string,int](8)
    for word in sentence.split(seps = Whitespace + punctuation):
        let lowercase = word.strip(leading=true, trailing=true, chars={'\''}).toLowerAscii
        if lowercase.len == 0:
            continue

        if result.hasKeyOrPut(lowercase, 1):
            result[lowercase] = result[lowercase] + 1
