/*
   ? = Optional set됐을 수도 있고. not set됐을 수도 있다. set되지 않은 것이 무엇인지 확실히 하기 위해 사용
     (String? 은 Optional타입인데 연관값이 String인것이지 String인데 Optional인게 아니다. )
   ! = 값이 set되었을때, 연관값을 꺼내온다
     (set되어야하는 시점에서 not set이 됐을때 !를 사용해 강제적으로 값을 꺼내오면 에러를 발견할 수 있다. )
 
   버튼 누르기 = Button에서 Controller로 & Action & 메소드
   display에 숫자 뜨기 = Controller에서 Button으로 & Outlet & property(인스턴스 변수)
*/


import UIKit

class ViewController: UIViewController {
 
    //func : 메소드
    //var : property(인스턴스 변수 등)
    
    //Ctrl + 버튼 드래그 : View와 Controller을 연결하는 것이다.
    //alt + 코드 클릭하면 작은 창 -> Reference 클릭하면 연관된 메소드 설명 등의 문서를 볼 수 있다.
    
    
    
    
    //Controller에서 Button으로 & Outlet & property(인스턴스 변수)
    @IBOutlet weak var display: UILabel?
    //선언의 ?와 !는 모두 optional을 의미한다.
    
    
    //모든 property는 초기값을 가져야한다. (Optional은 예외다. 명시 안해도 not set(nil)로 자동으로 초기화됨)
    //var userIsInTheMiddleOfTyping : Bool = false
    //위의 코드에서, swift는 타입 추론을 하기 때문에 Bool타입을 적지 않아도 된다. (false는 Bool타입이니까)
    var userIsInTheMiddleOfTyping = false
    
    
    //Button에서 Controller로 & Action & 메소드
    @IBAction func touchDigit(_ sender: UIButton) { //UIButton 타입의 인자 1개를 받는 메소드
        //sender의 타입인 UIButton에 대해 alt -> reference를 보면 메소드 중 currentTitle이 있다.
        //직관적으로 currentTitle이 현재 제목(버튼의 제목)을 가져올 수 있다고 짐작가능하다. 메소드의 내용을 보면
        //var something : String? {get} : ?는 옵셔널이라는 타입이고, get은 읽는 것만 가능하다는 것이다.
        
        
        let digit = sender.currentTitle!
        //var이 아닌 let으로 써야 경고가 사라진다.
        //let 쓰는 2가지 이유 (1) 코드를 읽는 사람들에게 변수의 값이 바뀌지 않을 것이라고 알려줌
        //                (2) Array나 Dictionary에 값을 추가하거나 빼지 않음 = Read only
        
        
    //사용자가 입력중이면
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!
            /* 1. display에 표시된 텍스트를 가져오는 것인데, display 는 위의 property로
               optional UILabel 타입이다. text를 Optional타입에 보낼 수 없다.
               그래서 !를 사용해서 UILable타입인 display의 연관값을 가져와야한다.
               그러면 Optional UILable을 추출해서 UILable이 되었고 text를 보내고 있다.
               (unwrap Optional -> UILable이 됨)
               2. currentTime이 Button의 property인 것처럼, text는 UILable의 property다.
                그냥 text로 두면 에러가 나는데, 그 이유는 alt + text 해보면 Optional String이라서
                text도 unwrap 해줘야한다. 그러면 textCurrentlyInDisplay의 타입은 그냥 String 이 된다.
             */
            
        
            display!.text = textCurrentlyInDisplay + digit
            //text는 alt해보면 Optional String이었는데 String이 되도록 set할수 있다는 걸 알수있음(또 이게 연관값이 됨)
            //not set의 방법은 : display!.text = nil //nil로 set하거나 위처럼 연관값으로 set할 수 있음을 뜻함
        } else {
    //사용자가 입력 중이지 않다면 (display의 text를 우리가 입력한 숫자와 같게 만든다.)
            display!.text = digit
        }
        
    ///어떤 경우에도 사용자는 값을 넣고 있다. (숫자를 입력하면 입력하는 중인 것이다. )
        userIsInTheMiddleOfTyping = true
        
        
        
        
        
        
        
     //   print("touched \(digit) digit")
        //digit 이 갖는 값은 currentTitle메소드의 리턴 타입인 String? 이다.
        //여기서 ?는 옵셔널이라는 타입이다.
        
        /* Optional : set되지 않은것이 무엇인지 확실히 하기 위해
 
         1.
             (1) 값이 설정되지 않은 것 (not set)
                 - swift에서는 nil이라는 키워드로 표현
                 - nil = Optional이 set되지 않은 상태
                (2) 값이 설정된 상태 (set)
                 - set 상태 : associated된 값을 가짐
                   ( associated 값은 set이 된 상태와 연결되어있다. not set은 set이 안되어있기 때문에 연결된게 없다)
         2.
             String? 은 Optional인데 associated된 값이 String이다. (String인데 Optional이다. (x))
             Optional String (기본적으로 Optional타입이다.)
         
         3.
             왜 currentTitle이 Optional타입일까? Title이 정해지지 않았을 수도 있으므로 Optional이다.
             왜 String일까? Button의 Title을 나타내고 있으므로 String이다.
         => 따라서 Optional String
         
         4. 이 Button에 값이 set되면 연관값을 어떻게 가져올까?
            끝부분에 !를 붙이면 된다. 느낌표는 강제적으로 연결값을 가져온다
            근데 set되지 않은 상태면? 느낌표가 연관값을 빼내려고 할때 에러가 발생한다.
            따라서 느낌표는 set되지않은 상태에 있는 Optional에서 값을 꺼내오려고 할때 앱을 충돌시킨다.
            앱이 충돌하기 때문에 느낌표 사용을 지양할 수도 있지만, 느낌표를 사용한다면 특정 시점에 set되어야하는
            무엇인가가 set되지 않았을때 에러를 발견할 수 있다는 점에서 좋다. (앱 고객이 사용하기 전에 발견가능)
         
         5. ! = 값을 꺼내오겠다 -> 따라서 let digit은 String?이 아니라 String 이 된다.
         
 
         */
    }
    
    
    
    
    
    
}

