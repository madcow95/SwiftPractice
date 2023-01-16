import UIKit

/**
    Property 감시자
    1. 사용하던 Property의 값이 변경됨에 따라 작업을 할 수 있다. React의 useState와 비슷한거 같다.
    2. 값이 변경되기 전에 호출하는 willSet / 변경된 후 호출하는 didSet
 */
class Account {
    var price: Int = 200 {
        willSet {
            print("월급이 \(price)만원에서 \(newValue)만원 으로 변경될 예정이다 제발")
        }
        
        didSet {
            print("월급이 \(oldValue)만원에서 \(price)만원 으로 변경됨 와!") // 하..
        }
    }
}

var mySalary: Account = Account()

mySalary.price = 450

class AccountCal {
   var price: Int = 200 {
       willSet {
           print("월급이 \(price)만원에서 \(newValue)만원 으로 변경될 예정이다 제발")
       }
       
       didSet {
           print("월급이 \(oldValue)만원에서 \(price)만원 으로 변경됨 와!") // 하..
       }
   }
    
    var dollarValue: Double {
        get {
            return Double(price)
        }
        set {
            price = Int(newValue * 1400)
            print("달러로 하면 \(newValue)")
        }
    }
}

class DollarAccount: AccountCal {
    override var dollarValue: Double {
        willSet {
            print("\(dollarValue) >>>>> \(newValue)")
        }
        didSet {
            print("\(oldValue) >>>>> \(dollarValue)")
        }
    }
}

let myAccount: DollarAccount = DollarAccount()
myAccount.price = 300
myAccount.dollarValue = 250
