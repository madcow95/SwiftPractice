import UIKit

// Optional
/*
    Swift에는 value가 있거나 없을 수 있음을 표현하는 타입인 optional을 제공
    ?을 이용해서 optional을 표현
    값 없음은 nil로 표현
 */

var age: Int? = nil
//print(age) -> nil

//age = 12
//print(age) -> Optional(12)

// Unwrapping Optionals
/*
    optional 타입에 값이 있는 경우, 그 값만 가져오고 싶을때가 있음
    이 때, optional 타입의 값만 가져오는 방법을 unwrapping 한다고 함
    대표적으로 if let을 이용해서 unwrapping 함
 */

if let unwrapped = age {
    print("age: \(unwrapped)")
} else {
    print("age is missing")
}

// Unwrapping with guard
/*
    method 또는 함수에서 guard 를 이용해서 초기에 조건을 검사할수 있음
    guard let 을 이용하면, method 초기에 옵셔널 타입에서 값이 있는 경우를 검사할 수 있음
 */

func printAge(age: Int?) {
    guard let unwrapped = age else {
        print("age is missing")
        return
    }
    print("age: \(unwrapped)")
}
/*
    age = 12 일경우
    printAge(age: age) -> age: 12
    age = nil 일경우
    printAge(age: age) -> age is missing
 */

// Force Unwrapping
/*
    옵셔널 타입에 값이 있다고 확신하는 경우, 강제 unwrapping 할 수 있음
    ! 키워드를 이용해 강제 unwrapping 구현
    진짜 확실하게 들어오지 않는 이상 잘 사용하지 않을거 같다.
 */
age = 12
let forcedUnwrapped = age!
//print(forcedUnwrapped) -> Optional(12)가 아닌 12

// Nil Coalescing
/*
    optional 타입에 값이 있을때는 해당 값을 넘겨 주면됨
    optional 타입에 값이 없는 경우, default 값을 설정하고 싶을때, nil coalescing을 이용할 수 있음
        ??을 이용해서 default 값 설정 해줌
 */
age = nil
// JS에서 age = age && 20 이랑 비슷? 여기선 age에 값이 있으면 20을 할당 한다는 뜻이지만
// Swift에서 ?? 는 age가 nil일 때 20을 할당한다
// 좀 더 복습을 해야할듯
let currentAge = age ?? 20
//print(currentAge)

struct Developer {
    var name: String
}

var choi: Developer? = Developer(name: "최광우")
// print(choi?.name) -> Optional("최광우")

choi = nil
// print(choi?.name) -> nil

// Typecasting
/*
  Swift에서는 부모 타입에서 자식 타입으로 변형가능한지 확인해볼때 as? 키워드를 사용
 */

class Animal {
    
}

class Cat: Animal {
    
}

class Dog: Animal {
    func bark() {
        print("wall wall")
    }
}

let pets: [Animal] = [Cat(), Dog(), Cat(), Dog()]

for (i, pet) in pets.enumerated() {
    // pet이 Dog타입으로 변환이 가능한지 Check
    if let dog = pet as? Dog {
        print(i) // 1, 3
        dog.bark()
    }
}
