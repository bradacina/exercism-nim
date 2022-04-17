from math import round

proc coefficient(planet: string): float {.noinit} =
    return case planet
        of "Earth": 31557600.0
        of "Mercury": 31557600 * 0.2408467
        of "Venus": 31557600 * 0.61519726
        of "Mars": 31557600 * 1.8808158
        of "Jupiter": 31557600 * 11.862615
        of "Saturn": 31557600 * 29.447498
        of "Uranus": 31557600 * 84.016846
        of "Neptune": 31557600 * 164.79132
        else: raise newException(ValueError, "invalid planet")

proc age*(planet: string, seconds: int64): float {.noinit} =
    return round( float(seconds) / coefficient(planet), 2)