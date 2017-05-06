//
//  LoginViewController.swift
//  UserInterface
//
//  Created by Mounir Ybanez on 05/04/2017.
//  Copyright © 2017 Ner. All rights reserved.
//

import UIKit

public class LoginViewController: UIViewController  {
    
    internal(set) public var emailTextField: UITextField!
    internal(set) public var passwordTextField: UITextField!
    internal(set) public var loginButton: UIButton!
    internal(set) public var loadingView: UIActivityIndicatorView!
    internal(set) public var titleLabel: UILabel!
    
    public var presenter: LoginArbiter!
    
    public var isShowingLoadView: Bool = false {
        didSet {
            if isShowingLoadView {
                view.isUserInteractionEnabled = false
                loadingView.startAnimating()
            } else {
                view.isUserInteractionEnabled = true
                loadingView.stopAnimating()
            }
        }
    }
    
    public override func loadView() {
        let loginView = UIView(frame: UIScreen.main.bounds)
        loginView.backgroundColor = UIColor.white
        
        titleLabel = UILabel()
        titleLabel.accessibilityIdentifier = "title_label"
        titleLabel.text = "Umalahokan"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFontWeightHeavy)
        titleLabel.textAlignment = .center
        
        emailTextField = UITextField()
        emailTextField.accessibilityIdentifier = "email_textfield"
        emailTextField.backgroundColor = UIColor.green
        
        passwordTextField = UITextField()
        passwordTextField.accessibilityIdentifier = "password_textfield"
        passwordTextField.backgroundColor = UIColor.green
        
        loginButton = UIButton()
        loginButton.accessibilityIdentifier = "login_button"
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.darkGray
        loginButton.addTarget(self, action: #selector(self.didTapLogin), for: .touchUpInside)
        
        loadingView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loadingView.accessibilityIdentifier = "loading_view"
        loadingView.hidesWhenStopped = true
        loadingView.backgroundColor = loginButton.backgroundColor
        
        loginView.addSubview(titleLabel)
        loginView.addSubview(emailTextField)
        loginView.addSubview(passwordTextField)
        loginView.addSubview(loginButton)
        loginView.addSubview(loadingView)
        
        view = loginView
    }
    
    public override func viewDidLayoutSubviews() {
        var rect = CGRect.zero
        
        rect.size.width = view.frame.width - 48
        rect.size.height = titleLabel.sizeThatFits(rect.size).height
        rect.origin.y = 44
        rect.origin.x = (view.frame.width - rect.width) / 2
        titleLabel.frame = rect
        
        rect.origin.y = rect.maxY + 16
        emailTextField.frame = rect
        
        rect.origin.y = rect.maxY + 16
        passwordTextField.frame = rect
        
        rect.origin.y = rect.maxY + 16
        loginButton.frame = rect
        
        loadingView.frame = loginButton.frame
    }
    
    internal func didTapLogin() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter.login(email: email, password: password)
    }
}

extension LoginViewController: LoginScene {
    
    public func showLoginError(message: String) {
        let controller = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}

