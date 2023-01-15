import UIKit

class Choi {
    var name: String = "최광우"
    var age: Int = 29
    var weight: Int = 71
    var height: Double = 185.5
    
    // 참조할 필요가 없을 때 메모리에서 해제
    // 이 과정을 소멸이라하고 소멸직전 deinit이 실행됨
    deinit {
        print("이 클래스는 이제 없습니다.")
    }
}

//var me: Choi = Choi()

// Class에 Optional Unwrap은 변수 뒤에 붙인다.
var me: Choi? = Choi()
print("이름: \(me!.name) 나이: \(me!.age)")

// 참조 해제라고 생각하면 될듯 하다.
me = nil

/**
    === 구조체와 클래스의 차이 ===
 
    공통점
    1. 값을 저장하기 위해 property를 정의할 수 있다.
    2. 기능 실행을 위해 method를 정의할 수 있다.
    3. 서브스크립트 문법을 통해 구조체 또는 클래스가 갖는 property에 접근하도록 property를 정의할 수 있다.
    4. 초기화될 때의 상태를 지정하기 위해 initialize를 정의할 수 있다.
    5. 초기구현과 더불어 새로운 기능 추가를 위해 extension을 통해 확장 가능
    6. 특정 기능을 실행하기 위해 특정 protocol을 준수할 수 있다.
 
    다른점
    1. 구조체는 상속 불가능
    2. 타입 캐스팅은 클래스의 인스턴스에만 허용
    3. deinitialize(deinit)은 클래스의 인스턴스에만 활용 가능
    4. 참조 횟수 계산(Reference Counting)은 클래스에서만 적용
 
    가장 큰 차이 : struct는 값 타입 / class는 참조 타입
 */

struct tempStruct {
    var name: String
    var age: Int
}

let tempStrData: tempStruct = tempStruct(name: "최광우", age: 29)
var copiedStrData: tempStruct = tempStrData
copiedStrData.name = "우광최"
print(tempStrData.name)     // 최광우
print(copiedStrData.name)   // 우광최
// 구조체는 임시할당한 데이터를 변경해도 원본 데이터는 변하지 않음

class tempClass {
    var name: String = "최광우"
    var age: Int = 29
}

let tempClassData: tempClass = tempClass()
var copiedClassData: tempClass = tempClassData
copiedClassData.age = 28

print(tempClassData.age)    // 28
print(copiedClassData.age)  // 28
// 클래스는 기존 인스턴스의 참조를 전달하기 때문에 복사된 값에 데이터를 변경했을 때 원본 데이터도 같이 변경이 된다~

/**
    그래서 Struct 써야되냐 Class 써야되냐
    Struct는 항상 값 타입
    Class는 인스턴스 참조 타입
    애플은 가이드라인에 따라 하나 이상이면 Struct를 사용하도록 권장
    1. 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
    2. 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
    3. Struct에 저장된 Property가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
    4. 다른 타입으로부터 상속받거나 자신을 상속할 필요가 없을 때
    솔직히 써놓고도 어떨때 골라 써야될지 잘 모르겠다
    근데 대부분 Class를 사용한다고 함
    쓰다보면 알게되겠지
 */
