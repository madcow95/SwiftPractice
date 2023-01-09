import UIKit

var greeting = "Hello, playground"

func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name)\n"
    }
    return result
}

func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name) \n"
    }
    return result
}
// 전달인자 레이블 변경을 통한 함수 중복 정의
print(sayHello("Choi", 3))
print(sayHello(to: "Kwang", repeatCount: 2))

