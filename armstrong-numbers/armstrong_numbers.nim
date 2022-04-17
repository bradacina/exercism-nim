from math import `^`
from sequtils import foldl

proc isArmstrongNumber*(number: int): bool =
    var m_number = number
    var digits: seq[int] = @[]
    var num_digits = 0;
    
    while m_number > 0:
        digits.add(m_number mod 10)
        m_number = m_number div 10
        num_digits.inc

    number == digits.foldl(a + (b ^ num_digits), 0)

    
    