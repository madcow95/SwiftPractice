import UIKit

// struct와 class의 공통점
// 1. 속성을 정의해서 값을 저장가능
// 2. 메소드를 정의해서 기능을 제공가능
// 3. 생성자를 정의해서 초기상태를 세팅가능
// 4. 확장을 이용해서, 기본 구현의 추가 기능을 더할 수 있음
// 5. 프로토콜을 구현해서 특정 기능을 제공할 수 있음

// 차이점
// 1. Class는 상속을 시킬 수 있음
// 2. Class는 레퍼런스 카운팅을 통해 Class instance에 대한 하나 이상의 참조를 허용
// 3. Class는 deinitialize 호출시, 이미 할당된 리소스(메모리)에서 해제 가능

// struct
// 1. 값을 저장하고 있는 stored property
// 2. 저장된 값이 아닌 계산된 값을 반환하는 computed property

struct Movie {
    var name: String
    var director: String
    
    var description: String {
        return "\(name) is \(director)'s best movie"
    }
}

var movie = Movie(name: "다크나이트", director: "놀란")

struct Task {
    var name: String
    var progress: Int {
        // didSet을 통해 Struct의 속성이 변경되었을 때 Event 감지 가능
        didSet {
            var str = ""
            for i in 1...10 {
                if progress >= i * 10 {
                    str += "*"
                } else {
                    str += "-"
                }
            }
            print("Current Progress : \(str)")
            if !str.contains("-") {
                print("Progress Complted!!!")
            }
        }
    }
    
    var isDone: Bool {
        return progress == 100
    }
}

var task = Task(name: "Job Task", progress: 0)
//for i in 1...10 {
//    task.progress = i * 10
//}

struct Student {
    let name: String
    var major: String
    var knowledge: Double
    
    func didFinalTest() -> Int {
        let howMuchIdontKnow = (1 - knowledge) * 100
        let score = 100 - Int(howMuchIdontKnow)
        return score
    }
    
    mutating  func didStudy() {
        if knowledge >= 1 {
            knowledge = 1
        } else {
            knowledge += 0.1
        }
    }
}

var student = Student(name: "최광우", major: "Swift", knowledge: 0.6)
//print(student.knowledge)
//student.didStudy()
//print(student.knowledge)
//student.didFinalTest()

// mutating method
// struct 인스턴스 생성시 let을 이용해서 상수로 생성하면, property 변경할 수 없음
// struct에서 method가 stored property 값을 변경하는 경우, mutating 키워드를 method 앞에 붙여줘야함

//let str: String = "Choi Kwang Woo"
//print(str.split(separator: " "))
//print(str.uppercased())
//print(str.lowercased())
//print(str.hasPrefix("Choi"))

// initialize(생성자)
// 1. 해당 struct를 만들 수 있게 해주는 특별한 타입의 메소드

struct iPhone1 {
    var model: String
}
let iPhone11 = iPhone1(model: "iPhone 13 Pro")

struct iPhone2 {
    var model: String
    init() {
        model = "iPhone 13 Plus"
    }
}
let iPhone22 = iPhone2()

struct iPhone3 {
    var model: String
    
    init(model: String = "iPhone 13") {
        self.model = model
    }
}

let iPhone33 = iPhone3()

struct Transactions {
    init() {
        print("Loading self history...")
    }
}
// Lazy Properties
// 퍼포먼스 측면에서 인스턴스 생성시, 속성이 쓰이는 시점에 생성하는 방법
struct SecondHandItem {
    var name: String
    // struct가 생성되는 시점에 실행
    // var history: Transactions = Transactions()
    
    // history 변수에 접근할 때 실행
    lazy var history: Transactions = Transactions()
    
    init(name: String) {
        self.name = name
    }
}

var usedMacbook = SecondHandItem(name: "M1 Macbook")
//usedMacbook.history

// Static Methods & Properties
// 지금까지 만든 메소드와 속성들은 개별 인스턴스를 만들 때 사용되는 것
// 개별 인스턴스와 달리, 해당 타입의 속성, 해당 타입 자체의 메소드를 만들어야 할 때 가 있음
// 이 때 static 키워드를 이용해서 타입의 속성 및 메소드를 정의할 수 있음
    
struct Person {
    static var name: String = "최광우"
    var age: Int
}

var choi = Person(age: 29)
var jeong = Person(age: 28)

// Access Control
// 객체간 협력을 하다보면, 협력 객체가 현재 객체에 접근할 때가 있음
// 그러다 보면, 외부 객체가 현재 객체의 속성을 임의로 수정할 때가 있음
//  다만, 외부 객체가 수정하면 안되는 경우가 있음
//  이때 속성 및 메소드 Access Control을 할 수 있음

// 접근 제어
// 외부 접근 가능 > public > internal(default) > fileprivate > private > 내부 접근 가능
struct UserAccount {
    private var id: String
    private var bill: Int
    internal var name: String
    
    init(id: String, bill: Int, name: String) {
        self.id = id
        self.bill = bill
        self.name = name
    }
    
    func billDescription() -> String {
        return "\(id)'s billing amount : \(bill)"
    }
}

var user1 = UserAccount(id: "choi", bill: 750, name: "최광우")
//user1.bill = 3500 -> private property는 외부에서 수정 불가
print(user1.billDescription())

