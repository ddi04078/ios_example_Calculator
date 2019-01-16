import UIKit


//이 코드는 내 앱이 '무엇'인지(여기서는 계산기)나타내는 것이라서 (계산을 하고 있으므로)
//계산하는 부분은 Controller가 아니라 Model이 되어야한다. 모델을 만들어주자. (MVC디자인)
//*** swift File은 Model을 위해, Cocoa Touch Class는 ViewController를 위한 새 파일이다.

class ViewController: UIViewController {
 
    //Controller에서 Button으로 & Outlet & property(인스턴스 변수)
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    //Button에서 Controller로 & Action & 메소드
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        //사용자가 입력중이면
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        
        //어떤 경우에도 사용자는 값을 넣고 있다. (숫자를 입력하면 입력하는 중인 것이다. )
        userIsInTheMiddleOfTyping = true
    }
    
    /*

     값을 물어볼 때마다 디스플레이에 있는 Double을 가져오고 값을 설정할 때마다 디스플레이의 값을 설정해주는
     계산 프로퍼티 만들기
     
     
     계산기앱에 추가하는 모든 연산은 Double형이다. 그러면 Double과 String을 번갈아 가며 타입변환을 해야한다.
     (계산 결과를 디스플레이에 넣거나, 디스플레이에서 값을 꺼내올때마다)
     그래서 계산할 때마다 디스플레이 안에 뭐가 있었는지 자동으로 추적할 변수를 만든다.
     이 변수는 값이 있다면, 디스플레이가 Double일 때의 값이고, 이 변수에 값을 넣는다면, 디스플레이를 set해준 것이다.
     좋은점은, Double값을 많이 사용해야하는 상황에서 매번 String으로 바꿀 필요가 없다는 뜻이다.
     값을 추적할 수 있는 변수로 가능한 일이다.
     */
    
    
    private var displayValue : Double{
        get{ //디스플레이의 값을 가져올때
            return Double(display.text!)!
        } // Double이 아니라 optional Double을 반환하는 이유는?
          // "Hello"의 Double형을 모르는 상황처럼 변환이 안될 수도 있기 때문이다.
        set{ //displayValue 에 set 하고 있는걸 디스플레이에 넣고 싶을때
            display.text = String(newValue)
        } // set에서는 항상 Double타입이 String으로 반환될 수 있기때문에 옵셔널이 아님
    }
     
    public var brain = CalculatorBrain()
    //public var brain : CalculatorBrain = CalculatorBrain()
    
    //모델과 컨트롤러를 연결하기 위한 (컨트롤러에서 계산에 해당하는 코드를 다 지우고, 모델로 넘겨줌)
    @IBAction private func perfomOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping { //사용자가 숫자를 입력 중이라면 brain의 setOperand에 디스플레이에 있는 값을 넘겨준다.
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathmaticalSymbol) //brain에게 그 symbol로 연산을 수행하기를 요청하고 싶어서 mathmaticalSymbol을 연산자로 넘겨준다.
        }
        displayValue = brain.result //연산 수행이 끝나면 디스플레이 안에 여기 있는 brain의 결과를 넣는다.
    }
    
}

