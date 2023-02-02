import UIKit

// 타입캐스팅
// Swift의 타입캐스팅은 인스턴스의 타입을 확인하거나 자신을 다른 타입의 인스턴스처럼 사용할 수 있다.

class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) Latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 5)
let latte: Latte = Latte(flavor: "Vanila", shot: 4)
let americano: Americano = Americano(shot: 8, iced: false)
//print(coffee.description)
//print(latte.description)
//print(americano.description)
//
//print(coffee is Coffee) // Data Type Check => true
//print(latte is Coffee) // => true이지만 서로 특성이 다르며 부모와 자식클래스의 관계가 아니기 때문에 서로 다른 타입이다.

// 메타타입
protocol SomeProtocal {}
class SomeClass: SomeProtocal {}

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocal.Protocol = SomeProtocal.self

var someType: Any.Type

someType = intType
//print(someType) // Int

someType = stringType
//print(someType) // String

someType = protocolProtocol
//print(someType) // SomeProtocol

// self 표현은 값 뒤에 써주면 그 값 자신을, 타입 이름 뒤에 써주면 타입을 표현하는 값을 반환한다.
// "stringValue".self는 "stringValue"그 자체를, String.self는 String 타입을 나타내는 값이다.

// 다운 캐스팅
// Coffee타입인 척 하는 Latte 타입의 인스턴스
let actionConstant: Coffee = Latte(flavor: "Green Tea", shot: 3)
print(actionConstant.description)
// 타입캐스트 연산자
// as? as!
// as? 해당 Property에 값이 없으면 nil을 반환
// as! 해당 Property에 값이 없으면 런타임 에러 발생
