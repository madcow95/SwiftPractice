import UIKit

/**
    접근제어
    - 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간에 접근을 제한할 수 있는 기능
    - 접근제어를 통해 상세 구현은 숨기고 허용된 기능만 사용하는 인터페이스를 제공할 수 있음
    - 은닉화를 구현하기 위한 핵심 기능
 
    접근수준                             키워드            접근도     범위                  비고
    1. 개방 접근수준                  open             높음        모듈 외부까지     Class에서만 사용
    2. 공개 접근수준                  public                          모듈 외부까지
    3. 내부 접근수준                  Internal                       모듈 내부
    4. 파일외부비공개 접근수준  fileprivate                    파일 내부
    5. 비공개 접근수준              private           낮음       기능 정의 내부
 */

// internal은 기본 접근수준이라 굳이 안써줘도 됨
open class OpenClass {
    open var openProperty: Int = 0
    public var publicProperty: Int = 0
    internal var internalProperty: Int = 0
    fileprivate var filePrivatepriperty: Int = 0
    private var privateProperty: Int = 0
    
    open func openMethod() {}
    public func publicMethod() {}
    internal func internalMethod() {}
    fileprivate func filePirvateMethod() {}
    private func privateMethod() {}
}

/**
    모든 타입에 적용되는 접근수준의 규칙은 상위 요소보다 하위 요소가 더 높은 접근수준을 가질 수 없다.
 */
/*
private class AClass {
    // 공개 접근수준을 부여해도 AClass의 접근수준이 비공개 접근수준이므로 이 Method의 접근수준도 비공개 접근수준으로 취급
    public func someMethod() {
        // public이지만 private이다
    }
}
*/
internal class InternalClass {} // 내부 접근수준 클래스
private struct PrivateStruct {} // 비공개 접근수준 구조체

// 요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이 publicTuple보다 낮기 때문에 사용할 수 없다.
// public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct()) -> 에러발생

// 접근수준에 따른 접근 결과
// AClass.swift파일에 있다고 가정
class AClass {
    func internalMethod() {}
    fileprivate func filePrivateMethod() {}
    var internalProperty: Int = 0
    fileprivate var filePrivateProperty = 0
}

// AInstance.swift에서 호출한다고 가정
let aInstance: AClass = AClass()
aInstance.internalMethod()      // 같은 모듈이므로 호출 가능
aInstance.filePrivateMethod()   // 다른 파일이라 에러
aInstance.internalProperty      // 같은 모듈이므로 호출 가능
aInstance.filePrivateProperty   // 다른 파일이라 에러

// filePrivate / private 차이
public struct SomeType {
    private var privateVariable = 0
    fileprivate var filePrivateVariable = 0
}

// 같은 타입의 익스텐션에서는 private 요소에 접근 가능
/**
    익스텐션이란
    - 기존 클래스, 구조체, 열거형 타입에 새로운 Property, Method, Initializer 등을 추가하는 것
    - 원본 타입(소스 코드)에 접근하지 못하는 타입들도 확장해서 사용할 수 있다
    - 쉽게 말하면 미리 만들어져 있는 struct나 class에 새롭게 추가할 수 있는거
 */
extension SomeType {
    public func publicMethod() {
        print("public Method >> \(self.privateVariable), \(self.filePrivateVariable)")
    }
    private func privateMethod() {
        print("private Method >> \(self.privateVariable), \(self.filePrivateVariable)")
    }
    fileprivate func filePrivateMethod() {
        print("filePrivate Method >> \(self.privateVariable), \(self.filePrivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()
    // mutating : struct의 method를 struct 내부에서 데이터 수정할 때는 mutating을 선언해 주어야 한다.
    mutating func someMethod() {
        // public 접근수준에는 어디서든 접근 가능
        self.someInstance.publicMethod()
        
        // 같은 파일에 속해 있는 코드이므로 filePrivate 접근수준 요소에 접근 가능
        self.someInstance.filePrivateVariable
        self.someInstance.filePrivateMethod()
        
        // 다른 타입 내부의 코드이므로 private 요소에 접근 불가 오류 발생
        // self.someInstance.privateVariable
        // self.someInstance.privateMethod()
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()

// 설정자의 접근수준 지정
public struct SomeType2 {
    // 비공개 접근수준 저장 Property count
    private var count: Int = 0
    
    // 공개 접근수준 저장 Property publicStoredProperty
    public var publicStoredProperty: Int = 0
    
    // 공개 접근수준 저장 Property publicGetOnlyStoredProperty
    // 설정자(Setter)는 비공개 접근수준
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    // 내부 접근수준 저장 Property internalComputedProperty
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    // 내부 접근수준 저장 Property internalGetOnlyComputedProperty
    // 설정자(setter)는 비공개 접근수준
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    public subscript() -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    // 설정자(Setter)는 내부 접근수준
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
}

var someInstance: SomeType2 = SomeType2()

// 외부에서 접근자(Getter), 설정자(Setter)모두 사용 가능
print(someInstance.publicStoredProperty) // 0
someInstance.publicStoredProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.publicGetOnlyStoredProperty)
// someInstance.publicGetOnlyStoredProperty = 100 -> 에러 발생

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.internalGetOnlyComputedProperty)
// someInstance.internalGetOnlyComputedProperty = 100 -> 에러 발생

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance[])
someInstance[] = 100
