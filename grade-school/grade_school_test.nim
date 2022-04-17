import unittest

# Given students' names along with the grade that they are in,
# create a roster for the school.

from grade_school import initSchool, roster, grade

suite "Grade School":

  test "Adding a student adds them to the sorted roster":
    let school = initSchool(students= @[("Aimee", 2)])

    check school.roster() == @["Aimee"]

  test "Adding more student adds them to the sorted roster":
    let school = initSchool(students= @[("Blair", 2), ("James", 2), ("Paul", 2)])

    check school.roster() == @["Blair", "James", "Paul"]

  test "Adding students to different grades adds them to the same sorted roster":
    let school = initSchool(students= @[("Chelsea", 3), ("Logan", 7)])
    
    check school.roster() == @["Chelsea", "Logan"]

  test "Roster returns an empty list if there are no students enrolled":
    let school = initSchool(students= @[])
    let expected: seq[string] = @[]

    check school.roster() == expected


  test "Student names with grades are displayed in the same sorted roster":
    let school = initSchool(students= @[
      ("Peter", 2),
      ("Anna", 1),
      ("Barb", 1),
      ("Zoe", 2),
      ("Alex", 2),
      ("Jim", 3),
      ("Charlie", 1)
    ])
  
    check school.roster() == @["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]

  test "Grade returns the students in that grade in alphabetical order":
    let school = initSchool(students= @[("Franklin", 5), ("Bradley", 5), ("Jeff", 1)])
  
    check school.grade(5) == @["Bradley", "Franklin"]

  test "Grade returns an empty list if there are no students in that grade":
    let school = initSchool(students= @[])
    let expected: seq[string] = @[]

    check school.grade(1) == expected
