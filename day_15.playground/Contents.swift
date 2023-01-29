import UIKit

// Monad
// flatMap
// flatMap은 Map과 같이 함수를 매개변수로 받고, 옵셔널은 모나드이므로 FlatMap을 사용할 수 있다.

// 함수와 FlatMap의 사용
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}
//print(Optional(3).flatMap(doubledEven)) // nil
//print(Optional(4).flatMap(doubledEven)) // Optional(8)

// map/flatMap 차이 : flatMap은 context 내부의 context를 모두 같은 위상으로 평평(flat)하게 펼쳐준다는 차이가 있다는데.. 이해는 잘 안된다
// 포장된 값 내부의 포장된 값의 포장을 풀어서 같은 위상으로 펼쳐준다..? 뭔소리래

// map과 compact의 차이
let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{$0}
let compactMapped: [Int] = optionals.compactMap{$0}

// 오호?
//print(mapped) // [Optional(1), Optional(2), nil, Optional(5)]
//print(compactMapped) // [1, 2, 5]

// 중첨된 컨테이너에서 Map과 FlatMap차이
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{$0.map{$0}}
let flatMappedMultipleContainer = multipleContainer.flatMap{$0.flatMap{$0}}


// 오호??
//print(mappedMultipleContainer) // [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
//print(flatMappedMultipleContainer) // [1, 2, 3, 4, 5]

// FlatMap의 사용
func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger)
    .flatMap(integerToString)
    .flatMap(stringToInteger)
// print(flattenResult) Optinal(2)

let mappedResult = optionalString.map(stringToInteger) // 더 이상 체인 연결 불가
print(mappedResult)
