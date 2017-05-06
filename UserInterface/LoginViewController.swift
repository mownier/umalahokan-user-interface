//
//  LoginViewController.swift
//  UserInterface
//
//  Created by Mounir Ybanez on 05/04/2017.
//  Copyright © 2017 Ner. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController  {

    public var isShowingLoadView: Bool = false
    
    fileprivate(set) public var presenter: LoginArbiter!
    private(set) public var emailTextField: UITextField!
    private(set) public var passwordTextField: UITextField!
    private(set) public var loginButton: UIButton!
    
    public override func loadView() {
        let loginView = UIView(frame: UIScreen.main.bounds)
        loginView.backgroundColor = UIColor.white
        
        emailTextField = UITextField()
        passwordTextField = UITextField()
        loginButton = UIButton()
        
        emailTextField.backgroundColor = UIColor.green
        
        loginView.addSubview(emailTextField)
        loginView.addSubview(passwordTextField)
        loginView.addSubview(loginButton)
        
        view = loginView
    }
    
    public override func viewDidLayoutSubviews() {
        var rect = CGRect.zero
        
        rect.size.width = view.frame.width - 48
        rect.size.height = 42
        rect.origin.y = 20
        rect.origin.x = (view.frame.width - rect.width) / 2
        emailTextField.frame = rect
    }
}

extension LoginViewController: LoginScene {
    
    public func showLoginError(message: String) {
        
    }
}

extension LoginModule {
    
    public convenience init() {
        let vc = LoginViewController()
        self.init(scene: vc)
        vc.presenter = self.presenter
    }
}
