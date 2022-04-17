import strutils

type triad = tuple[small:char, medium: char, large: char]

const triads: array[0..3, triad] = [
    ('I', 'V', 'X'),
    ('X', 'L', 'C'),
    ('C', 'D', 'M'),
    ('M', '\0', '\0')
]

proc roman*(number: int): string =
    var string_number = $number
    var triads_index = 0
    var current_index = string_number.len - 1
    
    while current_index >= 0:

        case string_number[current_index]
            of '1': result = triads[triads_index].small & result
            of '2': result = triads[triads_index].small.repeat(2) & result
            of '3': result = triads[triads_index].small.repeat(3) & result
            of '4': result = triads[triads_index].small & triads[triads_index].medium & result
            of '5': result = triads[triads_index].medium & result
            of '6': result = triads[triads_index].medium & triads[triads_index].small & result
            of '7': result = triads[triads_index].medium & triads[triads_index].small.repeat(2) & result
            of '8': result = triads[triads_index].medium & triads[triads_index].small.repeat(3) & result
            of '9': result = triads[triads_index].small & triads[triads_index].large & result
            else: discard

        triads_index.inc
        current_index.dec