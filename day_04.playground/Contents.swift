import UIKit

struct user {
    var username : String
    var password : String
    var name : String
    var age  : Int
}

var UserInfo = user(
    username : "choi",
    password : "1111",
    name : "최광우",
    age : 28
)

print(UserInfo.username)

class userClass {
    var username : String
    var password : String
    var name : String
    var age : Int
    
    init( username : String, password : String, name : String, age : Int ) {
        self.username = username
        self.password = password
        self.name = name
        self.age = age
    }
}

var UserClassInfo = userClass( username : "choi", password : "1234", name : "최광우", age : 28 )

print(UserClassInfo.username)

import UIKit

// 2진법으로 표시
let decimalInt : Int = 0b11100

// 1.23 * 10^5
let intMulti : Double = 1.23e5
// 1.23 * 10^-2
let intMultiMin : Double = 1.23e-2

// let 상수는 데이터 할당 불가능
let name : String = String()

var irum : String = String()
//print(irum.isEmpty) true
irum.append("최광우")
//print(irum.isEmpty) false

let nameis : String = "My Name is"
let kw : String = "최광우"
var fullName : String = nameis + kw

var upperLower : String = "aBcDefG"

//print(upperLower.uppercased()) 대문자로
//print(upperLower.lowercased()) 소문자로

// String, Int, Float, Double 등 사용가능
var anyData : Any = "아무거나"
//print(anyData)
anyData = 50
//print(anyData)
anyData = 123.123
//print(anyData)

// 임시로 type을 정의해서 사용할 수 있지만 효용성이 있나?
typealias tempInt = Int
typealias tempStr = String

let tempAge : tempInt = 29
let tempName: tempStr = "최광우"

//print("이름은 \(tempName) 나이는 \(tempAge)")

// 튜플
// 타입의 이름이 따로 지정되지 않은 타입
var person : (String, Int, Double) = ("ckw", 29, 170)
// 배열처럼 객체에 접근 가능
//print(person.2)

// 이름도 따롤 지정 가능
var person2 : (name : String, age : Int, height : Double) = ("ckw", 29, 170)
//print("이름 : \(person2.age)")

// 배열
var nameArr1 : Array<String> = ["choi", "jeong"]
var nameArr2 : [String] = ["choi", "jeong"]

// 빈 배열
var emptyArr1 : [Any] = [Any]()
var emptyArr2 : [Any] = Array<Any>()
var emptyArr3 : [Any] = []
// empty 배열 확인
//print(emptyArr3.isEmpty)

// 배열 추가
nameArr2.append("park")
//print(nameArr2.count)
// 배열 여러개 추가
nameArr2.append(contentsOf: ["kim", "lee"])
//print(nameArr2.count)

// 배열 속 특정값 search
// 없으면 nil
//print(nameArr2.firstIndex(of: "choi"))
// 배열의 첫번째
//print(nameArr2.first)
// 배열의 마지막
//print(nameArr2.last)

// javascript의 shift와 splice 합침
//let firstName : String = nameArr2.removeFirst()
// javascript의 pop과 splice 합침
//let lastName : String = nameArr2.removeLast()
// index에 해당하는 배열값
//let indexName : String = nameArr2.remove(at: 1)

// 해당 범위의 배열 가져옴
//print(nameArr2[0...4])

var SetName1 : Set<String> = Set<String>()
var SetName2 : Set<String> = []
var SetName3 : Set<String> = ["choi", "kwang", "woo"]

//print(SetName3)
// Set에 값 추가
// 하니까 뭔가 순서가 바뀜
SetName3.insert("jeong")
//print(SetName3)

// 이름이 직관적이라 좋음
// 실제 Set에 없는 항목을 remove하면 nil return
//print(SetName3.remove("kwang"))
//print(SetName3)

enum School1 : String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학교"
}

enum School2 {
    case primary, elementary, middle, high, college
}

var highestLevel : School1 = School1.college

//enum PastaTaste : String {
//    case cream = "크림"
//    case tomato = "토마토"
//}
//enum PizzaDough : String {
//    case cheeseCrust = "치즈 크러스트"
//    case thin = "얇은 도우"
//    case original = "오리지날"
//}
//enum PizzaTopping : String {
//    case pepperoni = "페퍼로니"
//    case cheese = "치즈"
//    case bacon = "베이컨"
//}
//enum MainDish {
//    case pasta(taste : PastaTaste)
//    case pizza(dough: PizzaDough, topping : PizzaTopping)
//    case chicken(withSause: Bool)
//    case rice
//}
//
//var Dinner : MainDish = MainDish.pasta(taste: PastaTaste.tomato)
//Dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)

enum Taste : CaseIterable {
    case cream, tomato
}
enum Dough : CaseIterable {
    case cheeseCrust, thin, original
}
enum Topping : CaseIterable {
    case pepperoni, cheese, bacon
}
enum Dish : CaseIterable {
    case pasta(taste: Taste)
    case pizza(dough: Dough, topping: Topping)
    case chicken(withSause : Bool)
    
    static var allCases : [Dish] {
        return Taste.allCases.map(Dish.pasta)
        + Dough.allCases.reduce([]) {
            (result, dough) -> [Dish] in result
            + Topping.allCases.map {
                (topping) -> Dish in Dish.pizza(dough: dough, topping: topping)
            }
        }
        + [true, false].map(Dish.chicken)
    }
}

//print(Dish.allCases.count)
// 2의 배수
//for i in 0...10 {
//    if i > 0 && i.isMultiple(of: 2) {
//        print(i)
//    }
//}

func sayHello(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

//print(sayHello(from: "Jeong", to: "Choi"))

func plus(a: Int, b: Int) -> Int {
    return a + b
}
func minus(a: Int, b: Int) -> Int {
    return a - b
}
func multi(a: Int, b: Int) -> Int {
    return a * b
}
//print(multi(a: 2, b: 3))

//let total: Int = 10
//var sum: Int = 0
//for i in 1...total {
//    if i.isMultiple(of: 2) {
//        sum += i
//    }
//}

//print(sum)
