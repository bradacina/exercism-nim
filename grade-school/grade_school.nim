from sequtils import mapIt
from algorithm import sortedByIt
from tables import initTable, Table, add, values, contains, `[]`, mgetOrPut

type 
    InputStudent* = tuple
        name: string
        grade: int

    Student = object
        name: string

    School* = object
        grades: Table[int, seq[Student]]

proc initSchool*(students: seq[InputStudent]): School {.noinit} =
    var school = School(grades: initTable[int, seq[Student]]())

    let sortedStudents = students.sortedByIt(it.name)
    
    for student in sortedStudents:
        let newStudent = Student(name: student.name)
        school.grades.mgetOrPut(student.grade, @[]).add(newStudent)
    
    return school

proc roster*(school: School): seq[string] =
    for grade in school.grades.values:
        for student in grade:
            result.add(student.name)

proc grade*(school: School, gradeNumer: int): seq[string] {.noinit} =
    if gradeNumer notin school.grades:
        return @[]

    return school.grades[gradeNumer].mapIt(it.name)