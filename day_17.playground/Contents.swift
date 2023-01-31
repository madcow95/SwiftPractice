import UIKit

// 상속
// 클래스는 Method나 Property 등을 다른 Class로부터 상속받을 수 있음

// 기반 Class : 다른 Class를 상속받지 않은 Class
//class Person {
//    var name: String = ""
//    var age: Int = 0
//
//    var introduce: String {
//        return "이름 : \(name) / 나이 : \(age)"
//    }
//
//    func speak() {
//        print("가나다라마바사")
//    }
//}

//let personClass: Person = Person()
//personClass.name = "최광우"
//personClass.age = 28
//print(personClass.introduce) 이름 : 최광우 / 나이 : 28
//personClass.speak() 가나다라마바사

// Class 상속
//class Student: Person {
//    var grade: String = "F"
//
//    func study() {
//        print("Study Hard...")
//    }
//}

//let person: Person = Person()
//person.name = "최광우"
//person.age = 28

// Person Class를 상속함으로써 student class에서도 Person의 Property를 사용할 수 있다.
//let student: Student = Student()
//student.name = "정유진"
//student.age = 28
//student.grade = "B"
//print(student.introduce)
//student.study()

// 재정의(Override)
// 자식 Class는 부모 Class로부터 물려받은 특성을 그대로 사용하지 않고 자신만의 기능으로 변경하여 사용 가능함.



class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduce: String {
        return "이름 \(name) / 나이 : \(age)"
    }
    
    func speak() {
        print("음..")
    }
    
    class func introduceClass() -> String {
        return "나의 소원은 이직입니다."
    }
}

class Student: Person {
    var grade: String = "A"
    
    func study() {
        print("준비 열심히 하자?")
    }
    
    override func speak() {
        print("요즘 좀 시들하다?")
    }
}

class Worker: Student {
    var major: String = ""
    
    class func introduceClass() {
        // 부모 Class의 Method에 접근하기 위해서는 super Property를 사용하면 된다고 한다.
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "직장인의 소원은 높은 연봉과 워라밸입니다."
    }
    
    // introduceClass에서 override 유무 차이
    // 1. 반환 타입이 다름 => Swift는 반환 타입이 다르면 다른 Method로 취급함
    // 2. 서로 다른 타입의 반환 값을 받아오기 위해 사용한 as => 나중에 설명한대
    
    override func speak() {
        super.speak()
        print("뉴진스 하입보이요.")
    }
}

let choi: Person = Person()
//choi.speak() 음..

let jeong: Student = Student()
//jeong.speak() 요즘 좀 시들하다?

let ko: Worker = Worker()
//ko.speak() 요즘좀 시들하다? / 뉴진스 하입보이요. => super.speak()를 사용함으로써 Student의 speak()와 worker의 speak()가 둘 다 실행

//print(Person.introduceClass()) 나의 소원은 이직입니다.
//print(Student.introduceClass()) 나의 소원은 이직입니다.
//print(Worker.introduceClass() as String) 직장인의 소원은 높은 연봉과 워라밸입니다.
//Worker.introduceClass() as Void 나의 소원은 이직입니다

// Property 재정의

class Person2 {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return self.age + 1
    }
    var introduction: String {
        return "이름 : \(name) / 나이 : \(age)"
    }
}

class Student2: Person2 {
    var grade: String = "A"
    
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
    }
}

let choi2: Person2 = Person2()
choi2.name = "최광우"
choi2.age = 28
//choi2.koreanAge = 28 => 오류 발생 get-only Property
//print(choi2.introduction) 이름 : 최광우 / 나이 : 28
//print(choi2.koreanAge) 29

let jeong2: Student2 = Student2()
jeong2.name = "정유진"
jeong2.age = 28
jeong2.koreanAge = 29 // age Property를 재정의 했기 때문에 오류발생 X
//print(jeong2.introduction) => 이름 : 정유진 / 나이 : 28 학점 : A
//print(jeong2.koreanAge) => 29
