import UIKit

/**
    확장
    서브스크립트
    1. 클래스, 구조체, 열거형 -> 컬렉션, 리스트, 시퀀스 등 타입의 요소에 접근하는 단축 문법
    2. 별로듸 Setter, Getter등의 메서드를 구현하지 않아도 인덱스를 통해 값을 설정하거나 가져올 수 있음
 */

// 읽기 전용 서브스크립트 정의 문법
//subscript(index: Int) -> Int {
//    get {
//        // 적절한 서브스크립트 값 반환
//        return 0
//    }
//}

//subscript(index: Int) -> Int {
//    // 적절한 서브스크립트 값 반환
//    return 0
//}
// 두 서브스크립트 정의는 동인한 역할

struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? {
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        
        set {
            guard var newStudent: Student = newValue else {
                return
            }
            
            var number: Int = index
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int? {
        get {
            return self.students.filter{$0.name == name}.first?.number
        }
        
        set {
            guard var number: Int = newValue else {
                return
            }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript (name: String, number: Int) -> Student? {
        return self.students.filter{$0.name == name && $0.number == number}.first
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "광우", "유진", "지섭", "성현")

//print(highSchool["지섭"]) ==> Optional(2)
//print(highSchool["재성"]) ==> nil
highSchool.addStudent(name: "재성")
//print(highSchool["재성"]) ==> Optional(4)

//let aStudent: Student? = highSchool[1]
//print(aStudent?.name) ==> Optional("유진")
//print(highSchool[]?.name) ==> Optional("광우")

// 타입 서브스크립트
enum School2: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School2? {
        return Self(rawValue: level)
        // return School(rawvalue: level)과 같은 표현
    }
}

let school: School2? = School2[2]
//print(school) Optional(middle)
