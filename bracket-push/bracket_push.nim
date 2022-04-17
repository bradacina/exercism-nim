proc popAndCheck(stack: var seq[char], item: char): bool =
    if stack.len == 0:
        return false

    item == stack.pop

proc isPaired*(expression: string): bool =
    var stack: seq[char] = @[]

    for item in expression.items:
        case item
        of '(', '[', '{': stack.add(item)
        of ')': 
            if not stack.popAndCheck('('):
                return false
        of ']':
            if not stack.popAndCheck('['):
                return false
        of '}':
            if not stack.popAndCheck('{'):
                return false
        else: discard
    
    stack.len == 0