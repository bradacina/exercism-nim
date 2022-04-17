import times
import math

const gigaSecond = initDuration(seconds = 10 ^ 9)

proc addGigasecond*(dt: DateTime): DateTime = 
    return dt+gigaSecond