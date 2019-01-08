import UIKit

class ViewController: UIViewController {
 
    //Controller에서 Button으로 & Outlet & property(인스턴스 변수)
    @IBOutlet weak var display: UILabel!
    /*선언하는 곳에 느낌표를 넣어주면 누구든 이것을 자유롭게 쓸 수 있고, 값을 암묵적으로 추출해서 사용할 것이라는 뜻
        (지금도 여전히 추출이 될 상태인데 만약 nil이라면 앱이 멈출 것이다.)
      이렇게 하면 모든 곳에 !가 있다고 암묵적으로 인정이 되므로 밑에서 display! -> display로 고치면 된다.
        (일일이 !안붙여도 된다. 선언에 느낌표 붙이면 암묵적으로 추출하므로)
      "강제적 추출 옵셔널" : 물음표 대신 느낌표를 넣어 어디서든 강제적으로 값을 가져오겠다.
    */
 
    var userIsInTheMiddleOfTyping = false
    
    //Button에서 Controller로 & Action & 메소드
    @IBAction func touchDigit(_ sender: UIButton) {
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
    
    @IBAction func perfomOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        //선언시 ! 붙음 : 강제적으로 값을 추출해 가져오겠다는 뜻
        /*근데 연산자 칸이 비어있을때도 문제가 없게하려면(!는 무조건 값을 가져오는데 만약 연산자 칸이 비어있을 경우를 위해)
          !대신 if문을 사용하면 된다. 그러면 set되었을때만 추출해온다. (swift는 읽기 쉽게 만들어진 문법)
         */
        //이때 mathmaticalSymbol은 범위 바깥에서 정의되지 않는 상수다.
        if let mathmaticalSymbol = sender.currentTitle{
            if mathmaticalSymbol == "π"{
                display.text = String(M_PI)
            }
        }
    }
    
}

