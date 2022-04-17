import tables

var map = {
    'G' : 'C',
    'C' : 'G',
    'T' : 'A',
    'A' : 'U'}.newTable()

proc toRna*(val: string): string =
    result = newString(val.len)

    var i = 0
    for letter in val.items:
        result[i] = map[letter]
        i+=1