import UIKit

/**
    함수형 프로그래밍
    Closure
    - 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것
    - 변수나 상수가 선언된 위치에서 참조(Reference)를 획득(Capture)하고 저장할 수 있음 => 변수나 상수의 Closing(잠금)이라고 함
    - 세가지의 형태
    - 1. 이름이 있으면서 어떤 값도 획득하지 않은 전역함수의 형태
    - 2. 이름이 있으면서 다른 함수 내부의 값을 획득하지 않은 전역함수의 형태
    - 3. 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축약 문법으로 작성한 형태
 
    - 특징
    - 1. Closer은 매개변수와 반환 값의 타입을 문맥을 통해 유추할 수 있기 때문에 매개변수와 반환 값의 타입을 생략 가능
    - 2. Closer에 단 한 줄의 표현만 들어있다면 암시적으로 이를 반환 값으로 취급
    - 3. 축약된 전달인자 이름 사용 가능
    - 4. 후행 Closer문법을 사용할 수 있음
 */

let names: [String] = ["이지섭", "최광우", "정유진", "박성현"]

func backwards(first: String, second: String) -> Bool {
    print("\(first)와 \(second) 비교중")
    return first < second
}

let reversedNames: [String] = names.sorted(by: backwards)

// 위와 같은 표현이지만 좀 더 간결하게
let reversed: [String] = names.sorted(by: {(first: String, second: String) -> Bool in
    return first > second
})

// 후행 Closure(Clousre가 조금 길어지거나 가독성이 조금 떨어질 때 사용)
let reversed2: [String] = names.sorted() {(first: String, second: String) -> Bool in
    return first > second
}

// sorted(by: ) Method의 소괄호까지 생략 가능
let reversed3: [String] = names.sorted{(first: String, second: String) -> Bool in
    return first > second
}

func doSomething(do: (String) -> Void,
                 onSuccess: (Any) -> Void,
                 onFailure: (Error) -> Void) {
    print("do something func")
}

doSomething {(someString: String) in
    print("do Clousre \(someString)")
} onSuccess: { (result: Any) in
    print("onSuccess Clousure \(result)")
} onFailure: { (error: Error) in
    print("onFailure Closure \(error)")
}

