proc isTriangle(sides:array[3, int]): bool =
    sides[0] + sides[1] > sides[2] and 
        sides[1] + sides[2] > sides[0] and 
        sides[2] + sides[0] > sides[1]

proc isEquilateral*(sides:array[3, int]): bool =
    sides.isTriangle and sides[0] == sides[1] and sides[1] == sides[2]

proc isIsosceles*(sides:array[3, int]): bool =
    sides.isTriangle and (sides[0] == sides[1] or sides[1] == sides[2] or sides[2] == sides[0])

proc isScalene*(sides:array[3, int]): bool =
    sides.isTriangle and sides[0] != sides[1] and sides[0] != sides[2] and sides[1] != sides[2]