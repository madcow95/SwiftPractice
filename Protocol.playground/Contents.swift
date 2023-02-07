import UIKit

// Protocol / Extension

// protocol
// 어떤 약속을 정해 놓은것, 약속 : properties, method
// 어떤 약속(역할)을 정해 놓은것이지 구현된 것은 아님
// 따라서, 개발할때는 어떤 객체가 해당 역할을 수행할지 정하고, 해당 객체가 그 역할을 어떻게 구현할지 정하면 됨 ==> 이를 protocol conforming(채택)이라함

// protocol 정의
protocol ClassPresident {
    var name: String { get }
    var className: String { get }
    
    func sayHello()
    func checkClassMember()
}

struct UnivPresidentStudent: ClassPresident {
    var name: String
    var className: String
    
    func sayHello() {
        print("아이고 종강이야")
    }
    
    func checkClassMember() {
        print("과모임 안온사람 누구야")
    }
}

// protocol을 상속? 했는데 protocol 내부의 구현하기로 약속된 항목들을 struct내부에 구현하지 않으면 에러가 발생
struct HighSchoolPresidentStudent: ClassPresident {
    var name: String
    var className: String
    
    func sayHello() {
        print("선생님 안녕하십니까")
    }
    
    func checkClassMember() {
        print("야자 짼놈들 나와")
    }
}

let jason = UnivPresidentStudent(name: "Jason", className: "공대")
let jake = HighSchoolPresidentStudent(name: "Jake", className: "이과")

//jason.sayHello() -> 아이고 종강이야
//jake.sayHello() -> 선생님 안녕하십니까
/**
    Protocol이 필요한 이유
    1. 개발하다 보면 다양한 객체를 만들게 됨
    2. 다양한 객체간에 공통 역할을 발견하게 됨
    3. 해당 역할을 한정된 객체에서만 쓰지 않고, 여러 객체로 확장이 필요할 때가 있음
    4. 이럴때, 그 역할을 Protocol로 정의하고 해당 역할이 필요한 객체가 나올 때마다, 해당 Protocol을 채택해서 역할을 줄 수 있음
 */

protocol Purchaseable {
    var name: String { get set }
}

func buy(_ item: Purchaseable) {
    print("난 \(item.name)을 살거다.")
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct Car: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var shot: Int
}

struct Laptop: Purchaseable {
    var name: String
    var company: String
}

let harryPorter: Book = Book(name: "Harry Porter", author: "조앤 롤링")
let johnWick: Movie = Movie(name: "John Wick", actors: ["키아누 리브스"])
let car: Car = Car(name: "음..", manufacturer: "아무데나")
let macbook: Laptop = Laptop(name: "맥북", company: "애플")
//buy(harryPorter)
//buy(johnWick)
//buy(car)
//buy(macbook)

// Protocol의 상속
// Protocol은 상속 받을 수 있음
// Class와 다르게 여러개 상속이 가능함
//  여러개 상속이 되다 보니, protocol을 더 작고 명확하게 나눌 수 있음
//  재사용성도 늘고 테스트 가능성도 더 높아짐
protocol Payable {
    func calculateWages() -> Int
}

protocol Trainable {
    func train()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, Trainable, HasVacation {}

struct Developer: Employee {
    var name: String
    
    func calculateWages() -> Int {
        // 받고싶다
        return 100_000_000
    }
    
    func train() {
        print("교육 받는 중")
    }
    
    func takeVacation(days: Int) {
        print("휴가를 \(days)일 쓰고싶다.")
    }
}

let choi: Developer = Developer(name: "최광우")
//print(choi.calculateWages())
//choi.takeVacation(days: 15)
//choi.train()
//print(choi.name)

// Extension
// 기존에 있던 타입에 기능을 추가 할 수 있게 도와줌
extension Int {
    func multiple(_ times: Int) -> Int {
        var returnInt = 1
        for _ in 0..<times {
            returnInt *= self
        }
        return returnInt
    }
}

let first = 2
let second = 10

//print(first.multiple(second)) -> 1024

// Protocol Extension
/*
 protocol은 어떤 역할에 대한 정의를 설명해줌
    - 실제 구현은 따로
 extension은 기능에 대한 구현까지 제공
    - 단, 한가지 타입에만 적용됨
 Protocol Extension은 두가지 단점을 보완 가능
    - protocol에 기본 구현을 제공해 줄 수 있음
    - protocol을 채택하는 여러 타입에 기능을 제공해 줄 수 있음
*/

extension Collection {
    func summarize() {
        print("There are \(count) members")
    }
}

let stringArray = ["a", "b", "c"]
let numSet = Set([1, 2, 3, 4, 5])

// stringArray.summarize() -> There are 3 members
// numSet.summarize() -> There are 5 members

// Protocol Oriented Programming
/**
    protocol은 어떤 역할에 대한 정의를 제공
    extension은 어떤 타입에 구현을 제공
    protocol extension은 어떤 역할에 대한 기본 구현 제공
 
    위 3가지 덕분에 POP(protocol oriented programming)이 가능함
 */

protocol Money {
    func calculateWages() -> Int
}

extension Money {
    func calculateWages() -> Int {
        return Int(100_000_000*0.9)
    }
}

protocol Train {
    func train()
}

extension Train {
    func train() {
        print("교육 시작")
    }
}

protocol Vacation {
    func takeVacation(days: Int)
}

extension Vacation {
    func takeVacation(days: Int) {
        print("휴가가 \(days)일 잘려버렸다.")
    }
}

protocol Develop: Money, Train, Vacation{}

struct DeveloperEmployee: Develop {
    var name: String
}

let kwang: DeveloperEmployee = DeveloperEmployee(name: "최광우")
//print(kwang.calculateWages()) -> 90_000_000
//kwang.train() -> 교육 시작
//kwang.takeVacation(days: 5) -> 휴가가 5일 잘려버렸다.
