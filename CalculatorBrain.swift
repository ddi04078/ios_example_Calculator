//API = CalculatorBrain에서 우리가 프로그래밍할 것들의 인터페이스다. (메소드, 프로퍼티..)

import Foundation
//Model(계산기의 뇌)에 관한 swift코드다. Model에는 절대 UIKit을 불러들이지 않는다.
//Foundation은 Core Service계층이다. UI가 아닌 기본적인 것들이 들어있다.

class CalculatorBrain{
    private var accumulator = 0.0 //값을 누적하기 위한 변수 //여기에 초기값을 넣어야 class가 초기값이 없다는 에러를 없앨 수 있다. //swift는 타입추론을 하므로 안적어줘도 된다.
    func setOperand(operand: Double) {
        accumulator = operand //operand로 들어오는 값으로 accumulator를 set한다.
        
    }
    
    //실질적으로 계산을 하기 위한 부분
    func performOperation(symbol: String) {
        switch symbol{
            case"π" : accumulator = M_PI
            case "⎷": accumulator = sqrt(accumulator)
            default : break
        }
    }
    
    var result: Double{
        get{
            //return 0.0
            return accumulator//현재 accumulator 값이 result가 된다.
        }
    }
    
    
    
}


//Brain을 실행하기 위해 하나의 메인 윈도우로 만든다.
