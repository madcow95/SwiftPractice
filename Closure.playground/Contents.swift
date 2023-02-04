import UIKit

// Closure 복습
/**
    closure
    1. 함수처럼 어떤 태스크를 수행하기 위한 코드 블록
        이름 있는 Closure -> 함수
        이름 없는 Closure -> Closure
    2. 함수와 아주 밀접하다고 함
 */

// Closure Ex 1
//let checking = {
//    print("checking!")
//}
//checking()

// Closure Ex 2
//let checking = { (id: String) in
//    print("checking id >>> \(id)")
//}
//checking("최광우")

// Closure Ex 3
let checking = {(id: String) -> Bool in
    if id == "최광우" {
        return true
    }
    return false
}
//
if !checking("최광우") {
    print("id is 최광우")
} else {
    print("id is somethin else")
}

// Closure를 함수 파라미터로 받기
// 받을 때는 굳이 input 이름을 지정해주지 않아도 되는구만
func validate(id: String, checking: (String) -> Bool) -> Bool {
//    print("Validation 준비중...")
    let isValid = checking(id)
    return isValid
}

let validationResult = validate(id: "최광우", checking: checking)
//print(validationResult)

let printHello = { () -> Void in
    print("Hello Swift!")
}

func doSomeClosure(_ action: () -> Void) {
    action()
}

//doSomeClosure(printHello) // Hello Swift!
//doSomeClosure({print("Hello Swift 2!")}) // Hello Swift 2!

// Closure 가독성 좋게
// 1
let validationResult2 = validate(id: "최광우", checking: { (id: String) -> Bool in
    if id == "최광우" {
        return true
    } else {
        return false
    }
})

// 2
let validationResult3 = validate(id: "최광우", checking: { id in
    return id == "최광우" ? true : false
})

// 3
// $0 : checking으로 들어오는 input의 value
// func validate에서 이미 return type 등이 미리 정해져 있기 때문에 가능
let validationResult4 = validate(id: "최광우", checking: { $0 == "최광우" })
let validationResult5 = validate(id: "최광우") { $0 == "최광우" }
print(validationResult2) // true
print(validationResult3) // true
print(validationResult4) // true
print(validationResult5) // true
