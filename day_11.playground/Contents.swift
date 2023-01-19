import UIKit

// initialize, deinitialize

// 열거형 initialize
enum Student: String {
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(age: Int) {
        switch age {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            return nil
        }
    }
    
    init?(born: Int, currentYear: Int) {
        self.init(age: currentYear - born + 1)
    }
}

var younger: Student? = Student(age: 20)
//print(younger ?? "default") // default

younger = Student(born: 2005, currentYear: 2023)
//print(younger!) // high

younger = Student(rawValue: "중학생")
//print(younger!) // middle

// deinitialize
class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File : \(self.fileName)")
    }
    func modifyFile() {
        print("Modify File : \(self.fileName)")
    }
    func writeFile() {
        print("Write File : \(self.fileName)")
    }
    func closeFile() {
        print("Close File : \(self.fileName)")
    }
    
    deinit {
        print("Deinitialize Start")
        self.writeFile()
        self.closeFile()
        print("Deinitialize End")
    }
}

var fileManager: FileManager? = FileManager(fileName: "슬램덩크.avi")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil // 로 instance를 초기화 해주면 FileManager class의 deinit이 실행된다.
