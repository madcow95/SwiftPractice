import UIKit

/**
    Property
    1. 저장 Property -> 인스턴스의 변수 또는 상수를 의미 => Struct와 Class에서만 사용 가능
    2. 연산 Property -> 값을 저장한 것이 아닌 특정 연산을 실행한 결과값, Class, Struct, 열거형에 사용
    3. 타입 Property ->
 */

// 저장 Property
struct CoordinatePoint {
    var x : Int
    var y : Int
}

let coordinate: CoordinatePoint = CoordinatePoint(x: 5, y: 10)

class Position {
    var point: CoordinatePoint
    
    let name: String
    
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let myPosition: Position = Position(name: "최광우", currentPoint: coordinate)

//print(myPosition.name) // 최광우
//print("\(myPosition.point.x), \(myPosition.point.y)") // 5, 10

// 지연 저장 Property
struct LazyCoordinate {
    var x: Int = 0
    var y: Int = 0
}

class LazyPosition {
    lazy var point : LazyCoordinate = LazyCoordinate()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let ChoiPosition: LazyPosition = LazyPosition(name: "우광최")

// 코드를 통해 LazyPosition.point로 접글할 때 point의 LazyPosition이 생성된다.
// 잘 사용하면 불필요한 성능저하나 공간 낭비를 줄일 수 있다.
print(ChoiPosition.point)

// 연산 Property
// 실제 값을 저장하는 Property가 아니라 특정 상태에 따른 값을 연산하는 Property
// getter, setter역할을 할 수도 있다

struct MethodCoordinate1 {
    var x: Int
    var y: Int
    // 대칭점을 구하는 Method - 접근자 getter?
    // Self는 자기 자신을 의미
    // Self대신 MethodCoordinate1를 사용해도 됨
    func oppositePoint() -> Self {
        return MethodCoordinate1(x: -x, y: -y)
    }
    
    // 대칭점을 설정하는 Method - 설정자 setter?
    mutating func setOppositePoint(_ opposite: MethodCoordinate1) {
        x = -opposite.x
        y = -opposite.y
    }
}

var CurrentPosition: MethodCoordinate1 = MethodCoordinate1(x: 5, y: -10)
print("Current Position ==> \(CurrentPosition)") // 5, -10
print("Opposite Position => \(CurrentPosition.oppositePoint())") // -5, 10

CurrentPosition.setOppositePoint(MethodCoordinate1(x: 15, y: 20))
print("Set Position To Opposite ==> \(CurrentPosition)") // -15, -20

// 위처럼 쓰면 쓰기가 좀 복잡해줘서 주로 아래처럼 사용함
struct MethodCoordinate {
    var x: Int
    var y: Int
    var oppositePoint: MethodCoordinate {
        // Getter
        get {
            return MethodCoordinate(x: -x, y: -y)
        }
        
        // Setter
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var MethodPosition: MethodCoordinate = MethodCoordinate(x: 6, y: -7)
print(MethodPosition) // 6, -7
print(MethodPosition.oppositePoint) // -6, 7

MethodPosition.oppositePoint = MethodCoordinate(x: 66, y: 77)
print(MethodPosition) // -66, -77

// 구조가 좀 어렵다
