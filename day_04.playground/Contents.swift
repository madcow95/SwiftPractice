import UIKit

struct user {
    var username : String
    var password : String
    var name : String
    var age  : Int
}

var UserInfo = user(
    username : "choi",
    password : "1111",
    name : "최광우",
    age : 28
)

print(UserInfo.username)

class userClass {
    var username : String
    var password : String
    var name : String
    var age : Int
    
    init( username : String, password : String, name : String, age : Int ) {
        self.username = username
        self.password = password
        self.name = name
        self.age = age
    }
}

var UserClassInfo = userClass( username : "choi", password : "1234", name : "최광우", age : 28 )

print(UserClassInfo.username)
