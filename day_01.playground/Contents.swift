import UIKit

// 조건문

// 변수명 : Data Type = 저장할 값
var isTrue : Bool = true

if( isTrue )  {
    print( "현재상태 true" )
} else {
    print( "현재상태 false" )
}

// 괄호 없이도 사용 가능
if isTrue {
    print( "현재상태 true" )
} else {
    print( "현재상태 false" )
}

var title : String = isTrue ? "현재상태 true" : "현재상태 false"

print( "title -> ", title);


// 반복문

// Collection : 데이터를 모아둔 것
// Array, Set, Dictionary, Tuple 등이 있음
let IntArray : [ Int ] = [ 1, 2, 3, 4, 5, 6 ]

// for
for i in IntArray {
    print("int >>> \(i)")
}

// for 조건포함 1
for i in IntArray where i > 3 {
    print("3보다 큼 >> \(i)")
}

// for 조건포함 2
for i in IntArray where i % 2 == 0 {
    print("짝수임 >> \(i)")
}

// enum

// 두 가지로 case 사용 가능
// JS의 Object와 같은거 같음
enum School {
    case elementary, middle, high, college
}

// Object의 value를 꺼내기 위해선 .rawValue를 붙여줌 안붙이면 Object의 key가 나감
enum Grade : Int {
    case first = 1
    case second = 2
    case third = 3
}


let yourSchool = School.high
let yourGrade = Grade.first.rawValue
print( "yourSchool / Grade >> \( yourSchool ) / \( yourGrade )")


enum SchoolDetail {
    case elementary(name : String)
    case middle(name : String)
    case high(name : String)
    case college(name : String)
    
    // Swift에서의 함수 사용
    // -> : return 시킬게 있다는 뜻(
    
    func getName() -> String {
        switch self {
            case .elementary( let name ) :
                return name
            case .middle( let name ) :
                return name
            case .high( let name ) :
                return name
            case .college( let name ) :
                return name
        }
    }
}

let yourSchoolName = SchoolDetail.middle(name: "초등학교").getName();
print(yourSchoolName);
