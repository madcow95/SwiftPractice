import UIKit

// Map, Filter, Reduce
// 웬만한 방법으론 다 써봐서 책에 적혀있는 내용 중 사용 안한거만 작성함
let even: [Int] = [0, 2, 4, 6, 8]
let odd : [Int] = [0, 1, 3, 5, 7]
// 이런식으로 map조건들을 미리 정해놓을 수 있음
let multiply: (Int) -> Int = {$0 * 2}

let evenMultiple = even.map(multiply)
let oddMultiple = odd.map(multiply)

//print(evenMultiple) // [0, 4, 8, 12, 16]
//print(oddMultiple) // [0, 2, 6, 10, 14]

let dictionary: [String: String] = ["a": "A", "b": "B"]

var keys: [String] = dictionary.map{(tuple: (String, String)) -> String in
    return tuple.0
}
//print(keys) // ["b", "a"]

let numbers: [Int] = [1, 2, 3, 4 ,5, 6, 7]
// 0 : 초기값, result : return에 작성된 연산 결과가 저장, next: 배열에 담긴 값들
var sum: Int = numbers.reduce(0, {(result: Int, next: Int) -> Int in
    return result + next
})
//print(sum)
// 위와 같은 표현
var sum2: Int = numbers.reduce(0) {$0 + $1}

// chain 형식으로도 가능
var result: Int = numbers.filter{$0.isMultiple(of: 2)}.map{$0 * 3}.reduce(0){$0 + $1}
print(result)
