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
 1. 올바른 이메일 형식 얼럿
 2. 보드 로딩할 때 스켈레톤 뷰
 3. rx 적용할 수 있는 부분 적용시켜보기
 
 이슈
 1. automaticdimension 이슈 -> 해결
    바텀 Constraint를 지정해주지 않아서 메서드가 작동하지 않았음.
 2. 디코딩 실패 에러(한 4시간 쓴듯) 너무 사소한 실수이지만 반복하지 않기 위해 기록.
    구조체의 특정 프로퍼티 타입이 json내에서 해당타입과 일치하지 않아서 생긴 에러.
    구조체 내에서는 username을 Int타입으로 지정했지만 json에서 username은 String타입이었음.
 3. 테이블뷰셀의 버튼이 클릭되지 않는 이슈 발생.
    원인: 버튼을 테이블뷰셀에 addSubView를 해줬기 때문. 테이블뷰셀에 addSubView를 해주면 contentView의 뒤로 들어가기때문에 유저가 클릭하는 것이 블락된다.
    해결: 테이블뷰셀이 아닌 contentView에 addSubView를 해줌.
 */
