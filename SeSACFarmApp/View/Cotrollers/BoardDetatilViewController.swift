//
//  BoardDetatilViewController.swift
//  SeSACFarmApp
//
//  Created by 박근보 on 2022/01/05.
//

import Foundation
import UIKit

class BoardDetailViewController: UIViewController {
    
    let mainView = BoardDetailView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super .viewDidLoad()

        mainView.backgroundColor = .white
        navigationItemConfig()
    }
    
    func navigationItemConfig() {
        
        navigationItem.leftBarButtonItem = mainView.backBarButton
        navigationItem.rightBarButtonItem = mainView.categoryBarButton
        
        mainView.backBarButton.target = self
        mainView.backBarButton.action = #selector(backBarButtonClicked)
    }
    
    @objc func backBarButtonClicked() {
        
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
