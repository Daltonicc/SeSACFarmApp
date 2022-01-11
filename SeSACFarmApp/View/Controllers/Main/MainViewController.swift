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
        
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginButtonClicked() {
        
        let vc = LoginViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
}

/*
 구현해야 할 것
 1. 올바른 이메일 형식 얼럿 -> 해결
 2. 보드 로딩할 때 스켈레톤 뷰
 3. rx 적용할 수 있는 부분 적용시켜보기(가입버튼 부분, )
 4. 댓글 없을 때 가운데에 이미지나 레이블 하나 보여주기 -> 해결
 5. 작성 및 수정해서 들어가면 바로 키보드 올려주게 구현. -> 해결
 6. 빈값 으로 작성했을 때 체크. -> 해결
 7. 키보드노티피케이션 -> 해결
 8. 텍스트필드 내부 좌측 여백 -> 해결 
 9. Board 구조체 부분 -> 포스트작성자 id인지, 댓글 작성자id인지, 전부 똑같은 이름이어서 너무 헷갈림; 전부 다르게 구분 지어주기 -> 해결.
 10. Token 갱신
 11. 게시물/댓글 삭제할 때 정말 삭제할건지 얼럿
 
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
 */

