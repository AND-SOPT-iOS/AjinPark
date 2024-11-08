//
//  RegisterViewController.swift
//  Toss
//
//  Created by 어진 on 11/2/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let RegisterView = RegisterView()
//        
//        RegisterView.onRegisterButtonTapped = { [weak self] in
//            self?.navigateToMainTabBar()
//        }
//        
        self.view = RegisterView
    }
    
//    private func navigateToMainTabBar() {
//        let tabBarController = TabBarController()
//        tabBarController.modalPresentationStyle = .fullScreen
//        self.present(tabBarController, animated: true, completion: nil)
//    }
}





