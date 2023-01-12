import UIKit

// Optional
// 값이 있을수도 없을수도 있다
var myName: String? = "Choi"

func nilCheck(value optionalCheck: Any?) {
    switch optionalCheck {
    case .none:
        print("There is no value")
    case .some(let value):
        print("value is >>> \(value)")
    }
}
//myName = nil
//nilCheck(value: myName)

let numbers: [Int?] = [2, nil, -4, nil, 100]

/*
    // switch를 이용한 배열 안에 nil check -> 일일이 해줘야해서 불편하다
    for number in numbers {
        switch number {
        case .some(let value) where value < 0 :
            print("value has minus >>> \(value)")
        case .some(let value) where value > 10 :
            print("value is over ten >>> \(value)")
        case .some(let value) :
            print("other value is >>> \(value)")
        case .none :
            print("value is nil")
        }
    }
*/

// Optional Unwrapping -> 옵셔널 강제 추출
// 옵셔널 값 뒤에 !를 붙여서 강제로 추출하지만 만약 강제로 추출한 값이 없다면 nil을 반환하며 런타임 오류 발생

// 옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 추출하여 할당해야됨
// var choi: String = myName!

// 방법 1. If 구문 등으로 처리
if myName == nil {
    print("myName is nil")
} else {
    print("My Name is \(myName)")
}


