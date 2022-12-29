import UIKit

// 동영상 (데이터) 모델 - struct / 구조체
struct VideoStruct {
    var name : String
    var like : Int
    var view : Int
}

var VideoInfo = VideoStruct( name : "동영상 1", like: 10, view: 50 )
var VideoInfoClone = VideoInfo

print(VideoInfoClone.name) // 동영상 1

VideoInfoClone.name = "비디오"

print(VideoInfoClone.name) // 비디오
print(VideoInfo.name) // 동영상 1

class VideoClass {
    var name : String
    var like : Int
    var view : Int
    // 생성자 -> 메모리에 올린다
    // init으로 매개변수를 가진 생성자 메소드를 만들어야 그 값을 가진 객체(Object)를 만들수 있다.
    init( name : String, like : Int, view : Int ) {
        self.name = name
        self.like = like
        self.view = view
    }
}

var VideoClassInfo = VideoClass( name : "동영상 2", like : 22, view : 20 )
var VideoClassClone = VideoClassInfo

print(VideoClassClone.name) // 동영상 2

VideoClassClone.name = "영화"

print(VideoClassClone.name) // 영화
print(VideoClassInfo.name) // 영화

// struct -> Clone의 값을 변경 -> Clone만 수정
// class  -> Clone의 값을 변경 -> Clone/원본 데이터 둘 다 수정됨

// class는 Clone을 만들어 다른 변수에 있어도 같은 memory 공간을 바라보고 있어 둘다 변경이 된다.
