import UIKit

class AClass {
    static func staticMethod() {
        print("AClass's static Method")
    }
    
    // class를 붙여주면 override 가능
    class func typeMethod() {
        print("AClass's type Method")
    }
}

class BClass: AClass {
    /**
        Static Method는 override 할 수 없음
        override static func staticMethod() {
             
         }
     */
    override class func typeMethod() {
        print("BClass's type Method which overrided")
    }
}

//AClass.staticMethod()
//AClass.typeMethod()
//BClass.typeMethod()

struct SystemVolume {
    // Type Property를 사용하면 언제나 유일한 값이 된다.
    static var volume: Int = 5
    
    // Type Property를 제어하기 위해 Type Method를 사용한다.
    static func mute() {
        self.volume = 0 // SystemVolume.volume = 0과 같음
    }
}

// 네비게이션으로 예시를 들어봄
class Navigation {
    // 네비게이션 인스턴스마다 음량을 따로 설정 가능
    var volume: Int = 5
    
    // 길 안내 음성 재생
    func guideWay() {
        // 음성 제외 다른 재생 음소거
        SystemVolume.mute()
    }
    
    // 길 안내 음성 종료
    func finishGuideWay() {
        // 기존 재생 음량 복구
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume) // 0

myNavi.finishGuideWay()
print(SystemVolume.volume) // 5
