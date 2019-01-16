//API = CalculatorBrain에서 우리가 프로그래밍할 것들의 인터페이스다. (메소드, 프로퍼티..)

import Foundation
//Model(계산기의 뇌)에 관한 swift코드다. Model에는 절대 UIKit을 불러들이지 않는다.
//Foundation은 Core Service계층이다. UI가 아닌 기본적인 것들이 들어있다.

class CalculatorBrain{
    func setOperand(operand: Double) { }
    
    func performOperation(symbol: String) { }
    
    var result: Double{
        get{
            return 0.0
        }
    }
    //get set 될 수 있는 public var를 만드는 대신 Double 타입의 변수를 만든다. 개발자는 set하지만(연산을 통해), 계산기를 사용하는 사용자는 그게 필요없기 때문이다.
    //즉, get부분만 시행해 readOnly 프로퍼티를 만든다. (저번에 Button의 currentTitle처럼)
    
    
}
