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

// Class
// struct와 다르게 memberwise initializer 제공되지 않음
/*
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let milk = Dog(name: "milk", breed: "Collie")
//print(milk.name)

// Class 상속
// 상속을 이용하면 기존 Class를 이용해서 실규 Class를 생성할 수 있음
//  기존 Class를 부모 또는 슈퍼 Class라고 부름
//  새로 생성한 Class를 자식 Class라고 부름
class Collie: Dog {
    init(name: String) {
        super.init(name: name, breed: "Collie")
    }
}
let milky = Collie(name: "milky")
 */
//print(milky.name)

// Overriding method
// 자식 Class는 부모 Class의 메소드를 그대로 쓸 수 있음

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func bark() {
        print("wall wall")
    }
}

class Collie: Dog {
    init(name: String) {
        super.init(name: name, breed: "Collie")
    }
    
    override func bark() {
        print("벽 벽")
    }
}

let parent = Dog(name: "Hi", breed: "Chiwawa")
let child = Collie(name: "Collie")

// final Class
// Class 상속은 강력하지만, 가끔은 상속을 허용하지 않아야 할 때가 있음
// 이럴 때 final 키워드를 이용해서 선언하면, 상속 불가능

// mutability
// class는 struct와 다르게 reference type이라 상수로 선언하더라도, 속성이 var로 선언해 놓았으면 변경 가능함
//  이 때문에, class는 메소드 앞에 mutating 키워드를 쓸 필요가 없음
//  속성을 변경 가능하지 않게 하려면 let으로 선언

class Human {
    var name: String
    
    init(name: String) {
        self.name = name
        print("initialize instance")
    }
    
    deinit {
        print("deinitialize instance : \(name)")
    }
    
    func printName() {
        print("my name : \(name)")
    }
    
    func updateName(to name: String) {
        self.name = name
    }
}

let sean = Human(name: "최광우")
sean.printName()
sean.name
sean.updateName(to: "정유진")
sean.name
sean.printName()

/**
    struct를 사용하는 걸 권장한다고는 하는데 현업가서 확인해보세요
    Choosing between structures and classes
    default로는 struct를 쓰라고 애플이 권장함
    class
        1. Object-C와 상호작용이 필요할때
    struct
        2. Protocol로 어떤 행동들을 채택하고 싶을 때? 상속? 뭔소리래
 */
