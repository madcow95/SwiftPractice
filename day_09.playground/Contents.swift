import UIKit

class AClass {
    // static은 별도의 생성자 없이 Class에 바로 접근 가능
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0 {
        willSet {
            print("값이 instanceProperty: \(instanceProperty)에서 newValue: \(newValue)로 변경됨")
        }
        didSet {
            print("값이 oldValue: \(oldValue)에서 instanceProperty \(instanceProperty)로 변경됨")
        }
    }
    
    static var typeComputeredProperty: Int {
        get {
            return typeProperty*100
        }
        set {
            typeProperty = newValue
        }
    }
}
AClass.typeProperty = 150
let aClassInstance: AClass = AClass()
//aClassInstance.instanceProperty = 100

struct Person {
    let name: String
    let nickName: String
    let age: Int
    
    var isAdult: Bool {
        return age > 20
    }
}

let choi: Person = Person(name: "최광우", nickName: "MadCow", age: 29)
let jeong: Person = Person(name: "정유진", nickName: "ENFJ", age: 29)
let noAdult: Person = Person(name: "뭐로하지", nickName: "어린이", age: 18)

let friends: [Person] = [choi, jeong]
let names: [String] = friends.map{$0.name} // [최광우, 정유진]
let nickNames: [String] = friends.map{$0.nickName} // [MadCow, ENFJ]
let adults: [String] = friends.filter{$0.isAdult}.map{$0.name} // [최광우, 정유진]

/**
    Instance Method는 특정 타입 내부에 구현한다.
    따라서 Instance가 존재할 때만 사용 가능 ==> 성능적으로 class가 나을거 같다는 생각이?
 */
class LevelClass {
    var level: Int = 1 {
        didSet {
            print("Level >> \(level)")
        }
    }
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    func levelDown() {
        print("Level Down!")
        level -= 1
        if level < 1 {
            reset()
        }
    }
    func jumpLevel(to: Int) {
        print("Jump To \(to)")
        if to < 1 {
            reset()
        } else {
            level = to
        }
    }
    func reset() {
        print("Reset!")
        level = 1
    }
}

var levelInstance: LevelClass = LevelClass()
//levelInstance.levelUp() // 2
//levelInstance.levelUp() // 3
//levelInstance.levelDown() // 2
//levelInstance.levelDown() // 1
//levelInstance.levelDown() // 1
//levelInstance.jumpLevel(to: 45) // 45

/**
    구조체나 열거형은 값 타입이므로 Method앞에 mutating 키워드를 붙여서 해당 Method가 Instance 내부의 값을 변경한다는 것을 명시
 */
struct LevelStruct {
    var level: Int = 1 {
        didSet {
            print("Level >>> [[\(level)]]")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    mutating func levelDown() {
        print("Level Down!")
        if level - 1 < 1 {
            reset()
        } else {
            level -= 1
        }
    }
    mutating func reset() {
        print("Reset Complete!")
        level = 1
    }
    mutating func jumpLevel(to: Int) {
        print("jump to level \(level)")
        if to < 1 {
            reset()
        } else {
            level = to
        }
    }
}

var levelStruct: LevelStruct = LevelStruct()
//levelStruct.jumpLevel(to: -5)

/**
    self Property
    Java / JavaScript의 this와 비슷하게 Instance 자기 자신을 가리키는 Property
 */
class SelfLevelClass {
    var level: Int = 0
    
    func jumpLevel(to: Int) {
        print("Jump Level To >>> \(to)")
        self.level = to > 0 ? to : 1
    }
}

var selfClassInstance: SelfLevelClass = SelfLevelClass()
selfClassInstance.jumpLevel(to: -5)
print(selfClassInstance.level)
