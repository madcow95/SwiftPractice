import UIKit

/**
    Optional Chaining
    1. Optional에 속해 있는 nil일지도 모르는 Property, Method, Subscription 등을 가져오거나 호출할 때 사용할 수 있는 일련의 과정
        - Optional에 값이 있다면 Property, Method, Subscript등을 호출할 수 있고, Optional이 nil 이라면 Property, Method, Subscript 등은 nil을 반환
 */

class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func getFullAddr() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.getFullAddr() {
            print(address)
        }
    }
    
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

let me: Person = Person(name: "최광우")
//let myRoomViaOptionalChaining: Int? = me.address?.building?.room?.number
//print(myRoomViaOptionalChaining) // me의 adress 속성이 nil이므로 nil이 반환됨

var roomNumber: Int? = nil

if let myAddress: Address = me.address {
    if let myBuilding: Building = myAddress.building {
        if let myRoom: Room = myBuilding.room {
            roomNumber = myRoom.number
        }
    }
}

// 위와 같은 코드임 훨씬 짧고 가독성있게 쓸 수 있다.
//if let roomNumber2: Int = me.address?.building?.room?.number {
//    print("room number is >> ", roomNumber2)
//} else {
//    print("There is no room number")
//}

//roomNumber = 4
//if let number: Int = roomNumber {
//    print("room number is >> ",number)
//} else {
//    print("There is no room number")
//}

// 정상적 값 할당
me.address = Address(province: "서울특별시", city: "강서구", street: "가로공원로")
me.address?.building = Building(name: "카우")
me.address?.building?.room = Room(number: 0)
me.address?.building?.room?.number = 707

//me.address?.printAddress()
//print(me.address?.building?.room?.number) // Optional(707)

// Optional Chaining을 통한 Method 호출

// 빠른 종료
// guard ==> 빠른 종료를 위한 핵심 키워드, guard 구문은 if 구문과 유사하게 Bool 타입의 값으로 동작함.
// guard 뒤에 따라붙는 코드의 실행 결과가 true일 때 코드가 계속 실행
// guard는 항상 else가 뒤에 따라야함
// guard를 종료할 때는 return, break, continue, throw등의 제어문을 사용

// 일반 for loop
//for i in 0...3 {
//    if i == 2 {
//        print(i)
//    } else {
//        continue
//    }
//}

// guard 사용 for loop
//for i in 0...3 {
//    guard i == 2 else {
//        continue
//    }
//    print(i)
//}

// guard 구문의 Optional Binding 활용
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location: String = person["location"] else {
        print("No location")
        return
    }
    
    print("I'm in \(location)")
}

// [String: String] : Dictionary라는 뜻 이렇게 쓰는 거였구나
var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Choi"
personInfo["location"] = "Seoul"

greet(personInfo)

