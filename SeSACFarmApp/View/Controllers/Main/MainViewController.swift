//
//  ViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/01.
//

import UIKit

class MainViewController: UIViewController {

    let mainView = MainView()
    
    override func loadView() {
        
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        buttonConfig()
    }

    func buttonConfig() {
        
        mainView.startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        mainView.loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    @objc func startButtonClicked() {
        
        customPushViewController(pushVC: SignUpViewController())
    }
    
    @objc func loginButtonClicked() {

        customPresentViewController(presentVC: LoginViewController(), completion: nil) 
    }
}

/*
 구현해야 할 것
 1. 올바른 이메일 형식 얼럿 -> 해결
 2. 보드 로딩할 때 스켈레톤 뷰
 3. rx 적용할 수 있는 부분 적용시켜보기(가입버튼 부분, ...)
 4. 댓글 없을 때 가운데에 이미지나 레이블 하나 보여주기 -> 해결
 5. 작성 및 수정해서 들어가면 바로 키보드 올려주게 구현. -> 해결
 6. 빈값 으로 작성했을 때 체크. -> 해결
 7. 키보드노티피케이션 -> 해결
 8. 텍스트필드 내부 좌측 여백 -> 해결 
 9. Board 구조체 부분 -> 포스트작성자 id인지, 댓글 작성자id인지, 전부 똑같은 이름이어서 너무 헷갈림; 전부 다르게 구분 지어주기 -> 해결.
 10. Token 갱신 -> 로그인뷰컨으로 넘어가게 해결
 11. 게시물/댓글 삭제할 때 정말 삭제할건지 얼럿 -> 해결
 12. 자주 쓰는 UI extension으로 빼기 -> 해결
 13. 비밀번호 변경 -> 해결
 
 이슈
 1. automaticdimension 이슈 -> 해결
    바텀 Constraint를 지정해주지 않아서 메서드가 작동하지 않았음.
 2. 디코딩 실패 에러(한 4시간 쓴듯) 너무 사소한 실수이지만 반복하지 않기 위해 기록.
    구조체의 특정 프로퍼티 타입이 json내에서 해당타입과 일치하지 않아서 생긴 에러.
    구조체 내에서는 username을 Int타입으로 지정했지만 json에서 username은 String타입이었음.
 3. 테이블뷰셀의 버튼이 클릭되지 않는 이슈 발생.
    원인: 버튼을 테이블뷰셀에 addSubView를 해줬기 때문. 테이블뷰셀에 addSubView를 해주면 contentView의 뒤로 들어가기때문에 유저가 클릭하는 것이 블락된다.
    해결: 테이블뷰셀이 아닌 contentView에 addSubView를 해줌.
 4. HttpMethod에서 PUT으로 지정했으나 PUT으로 호출을 안하고 계속 디폴트 값인 GET으로 호출하는 이슈.
    원인: header에서 Content-type을 setValue 해주지 않아서 생긴 문제.
    해결: 해당값을 setValue했다.
    의문: post도 Content-type이 필요한데 왜 post 호출할 때는 Content-type setValue 안해도 잘 호출되는건지.
 5. 글을 수정하는 뷰컨트롤러에서 글을 수정하고 완료한 뒤 pop으로 이전화면으로 돌아오면 수정된 글이 최신화되어 있지 않는 이슈 존재.
    원인: 새롭게 초기화한 뷰컨트롤러의 프로퍼티에 값을 담아놓고, 이전 뷰컨트롤러로 pop 해버렸으니 당연히 프로퍼티에 값이 안담겨 있을 수 밖에.
         새롭게 초기화한 뷰컨트롤러로 push해줬다. => 문제있음. 새롭게 초기화한 뷰컨트롤러로 푸쉬했더니 나머지 프로퍼티값들이 아무것도 안 담겨있음. 개선 필요.
    해결: 이전 뷰컨트롤러로 pop은 그대로 하지만, 이전 뷰컨트롤러 viewWillAppear 메서드에 API 호출해서 수정된 값을 넣어줌.
 6. 새롭게 갱신할때마다 API호출을 계속 하게끔 코드를 짜고 있는데, 호출을 좀 줄이면서 갱신할 수 있는 방법은 없을까.
 7. 한국 시간으로 맞췄지만 시차가 여전히 존재. 개선 필요 11시간 차이 남.
    해결: date에 addTimeInterval 해줌.
 8. 마지막 인덱스를 보면 새로운 보드 데이터를 fetch 해주려 했으나 실패.
 9. MainboardViewController에서 댓글버튼을 클릭하면 바로 댓글창을 FirstResponder로 해주려 했다. 그런데, 댓글창을 눌러서 넘어가면 키보드노티피케이션이 작동하지 않는 이슈 존재.
 10. 이슈는 아니지만 API 호출로 받아오는 JSON 데이터들의 이름이 모두 비슷해서 구분하기 힘들었음.
    해결: CodingKey를 활용 -> 알아보기 쉽게 이름을 바꿨다.
 
 회고
 1. 이번 과제에서는 옵셔널 바인딩 대신에 guard문과 guard let문이 많이 활용됐다. guard문의 특성을 살릴 수 있는 부분들이 많았다(로그인뷰컨, 회원가입 뷰컨)
 2. 자주쓰고 반복되는 코드들은 최대한 extenstion으로 빼려고 했다. APIService의 타입메서드들 대부분 반복되는 코드들인데 줄이지 못했다. 방법 찾아봐야할 듯.
 3. Rx를 한 군데라도 적용시켜보려고 했는데, 아직 이해가 부족해서 적용하지 못했다. 강의를 좀 더 찾아 듣는 등 보충학습이 필요하다.
 4. 전반적으로 받아오는 JSON데이터들이 불편했다. 예를 들어 id가 있다면 게시물id, 작성자id, 코멘트id 모두 다른 id들인데 모두 동일하게 그냥 id로 오는 등 다양한 불편한 점이 존재했다.(구조체의 재사용을 위해서 이렇게 다 동일한건가 생각했지만 그건 아닌듯)
 5. 비슷한 뷰컨트롤러가 많아서 상속을 활용해보고 싶었지만 아직 익숙하지가 않아서 적용해보지는 못했다.
 6. MVVM패턴을 처음으로 적용시켜본 과제이다. 각 요소들이 무슨 역할을 담당하는지 직접 코드를 쓰면서 구조에 대해 심층적으로 이해할 수 있었다. 그러나 여전히 부족한 부분도 많이 느꼈다. 예를 들어 어떤 로직을 뷰모델 클래스에 넣어놔야할지, 뷰컨트롤러 클래스에 넣어놔야할지 모호하다. 또 Observable을 언제 어떻게 적용해야할지도 아직 헷갈린다. 이것도 보충학습 필요.
 7. 처음보다 코드로 UI를 짜는게 많이 익숙해졌다. 이번 과제의 UI가 쉬워서일 수도 있지만 예전보다 자신감은 확실히 생긴듯.
 */

