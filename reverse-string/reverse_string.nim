proc reverse*(val: string): string =
    var ret = newString(val.len);

    for i in 0..<val.len:
        ret[i] = val[val.len - i - 1]

    return ret