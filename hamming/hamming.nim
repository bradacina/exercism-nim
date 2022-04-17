proc distance*(left: string, right: string): int =
    if left.len != right.len:
        return 0
    
    var count = 0;
    for i in 0..<left.len:
        if left[i] != right[i]:
            count+=1
    
    return count