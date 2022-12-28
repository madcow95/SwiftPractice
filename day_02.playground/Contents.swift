import UIKit

// 반복문
let array : [ Int ] = [ 1, 2, 3, 4, 5, 6, 7 ,8 , 9, 10 ]

// 1
for i in array {
    print( "i >> \(i)" )
}

// 2
// 0 - 10 까지 반복 => range
for i in 0...10 {
    print( "i >> \(i)" )
}

// 3
// 0 - 9 까지
for i in 0..<10 {
    print( "i >> \(i)" )
}

// 4
for i in 0..<10 where i % 2 == 0 && i > 0 {
    print( "i 중 짝수만 >> \(i)" )
}

// 임의의 숫자 배열 생성
var randomIntArr : [ Int ] = [ Int ]()

// index가 필요 없을때는 _ 입력
// array에 값 할당 -> append
for _ in 0..<25 {
    let rndNum = Int.random( in : 0...100 )
    randomIntArr.append( rndNum )
}

print(randomIntArr.sorted())


// optional : 값이 있는지 없는지(null check) 모른다.
// ?가 붙는다 : 값이 있을수도 없을수도 있다(Option) 없으면 필수로 값이 있단 소린가?
var someVariable : Int? = nil

if someVariable == nil {
    someVariable = 90
}

// unwrapping : Optioncal으로 감싸져 있는 것을 벗기는 것?
if let otherVariable = someVariable {
    // someVariable에 값이 있다면 otherVariable에서 사용한다.
    print( "언래핑 됨 즉, someVariable에 값이 있다.\(otherVariable)" )
} else {
    print( "값이 없다." )
}

// Optional 상태의 값들은 unWrap을 해줘야함.
var first : Int? = 50
var second : Int? = 20

// param: 형식으로 쓰기 싫으면 unWrap param 앞에 _ 붙이면됨
unWrap( param: first )
unWrap( param: second )

// unWrap을 위한 함수
func unWrap( param : Int? ) {
    // unWrap함수의 param에 들어온 값이 있다면 unWrappedValue에 할당
    // 그렇지 않다면 패스
    // guard란?
    guard let unWrappedValue = param else {
        return
    }
    print( "unWrappedValue >>> \(unWrappedValue)" )
}
