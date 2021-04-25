import UIKit

var str = "Hello, playground"
print(str)


protocol Student {
    // 프로퍼티는 항상 var 로 선언해야 한다
    // optional 이 붙은 함수는 꼭 구현하지 않아도 된다

    var name: String { get }
    var studentNo: Int { get set }

    func height() -> Double

}

class StudentInfo: Student {

    var name: String {
        return "Alice"
    }
    

    var studentNo: Int {
        get {
            return self.studentNo
        }
        set {
            self.studentNo = 123
        }
    }

    func height() -> Double {
        return 161.1
    }

    // 어떻게 쓰는건지 모르겠다;;;

    

}

let studentInfo = StudentInfo()
//studentInfo.name = "송가영"
print(studentInfo.name)


protocol Student2 {
  var height: Double { get set }
  var name: String { get }
  static var schoolNumber: Int { get set }
}

class Aiden: Student2 {
    var roundingHeight: Double = 0.0
    var height: Double {
        get {
            return roundingHeight
        }
        set {
            roundingHeight = 183.0
        }
    }
    var name: String = "Aiden"
    static var schoolNumber: Int = 20112330
}

let aiden = Aiden()
print(aiden.height, aiden.name, Aiden.schoolNumber)
// 0.0 Aiden 20112330
aiden.height = 183.0
print(aiden.height, aiden.name, Aiden.schoolNumber)
// 183.0 Aiden 20112330
