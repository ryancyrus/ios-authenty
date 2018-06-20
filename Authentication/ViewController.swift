//
//  ViewController.swift
//  Authentication
//
//  Created by Ryan on 2018-06-07.
//  Copyright © 2018 Ryan. All rights reserved.
//

import UIKit

enum authType {
    case SignUp
    case SignIn
}

class ViewController: UIViewController {
    let authView = UIView()
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        super.view.addSubview(authView)
        
        emailField.placeholder = "email"
        emailField.borderStyle = .roundedRect
        emailField.textContentType = UITextContentType.emailAddress
        emailField.isSecureTextEntry = false
        authView.addSubview(emailField)

        passwordField.placeholder = "password"
        passwordField.borderStyle = .roundedRect
        passwordField.textContentType = UITextContentType.password
        passwordField.isSecureTextEntry = true
        authView.addSubview(passwordField)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        authView.addSubview(loginButton)
        setupViewConstraints()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewConstraints() {
        authView.translatesAutoresizingMaskIntoConstraints = false
        let authViewCenterX = NSLayoutConstraint(item: authView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        let authViewCenterY = NSLayoutConstraint(item: authView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        let authViewHeight = NSLayoutConstraint(item: authView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.35, constant: 0)
        let authViewWidth = NSLayoutConstraint(item: authView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0)
        view.addConstraints([authViewCenterX, authViewCenterY, authViewWidth, authViewHeight])
        
        emailField.translatesAutoresizingMaskIntoConstraints = false
        let emailFieldCenterX = NSLayoutConstraint(item: emailField, attribute: .centerX, relatedBy: .equal, toItem: authView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let emailFieldTopSpace = NSLayoutConstraint(item: emailField, attribute: .top, relatedBy: .equal, toItem: authView, attribute: .topMargin, multiplier: 1.0, constant: 20)
        let emailFieldWidth = NSLayoutConstraint(item: emailField, attribute: .width, relatedBy: .equal, toItem: authView, attribute: .width, multiplier: 0.55, constant: 0)
        let emailFieldHeight = NSLayoutConstraint(item: emailField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        authView.addConstraints([emailFieldCenterX, emailFieldTopSpace, emailFieldWidth, emailFieldHeight])
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        let passwordFieldCenterX = NSLayoutConstraint(item: passwordField, attribute: .centerX, relatedBy: .equal, toItem: authView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let passwordFieldTopSpace = NSLayoutConstraint(item: passwordField, attribute: .top, relatedBy: .equal, toItem: emailField, attribute: .bottomMargin, multiplier: 1.0, constant: 20)
        let passwordFieldWidth = NSLayoutConstraint(item: passwordField, attribute: .width, relatedBy: .equal, toItem: authView, attribute: .width, multiplier: 0.55, constant: 0)
        let passwordFieldHeight = NSLayoutConstraint(item: passwordField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        authView.addConstraints([passwordFieldCenterX, passwordFieldTopSpace, passwordFieldWidth, passwordFieldHeight])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        let loginButtonCenterX = NSLayoutConstraint(item: loginButton, attribute: .centerX, relatedBy: .equal, toItem: authView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let loginButtonTopSpace = NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: passwordField, attribute: .bottomMargin, multiplier: 1.0, constant: 20)
        let loginButtonWidth = NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: authView, attribute: .width, multiplier: 0.20, constant: 0)
        let loginButtonHeight = NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        authView.addConstraints([loginButtonCenterX, loginButtonTopSpace, loginButtonWidth, loginButtonHeight])
    }
    
    
    @objc func pressed(){
        print("pressed")
        
    }
    


}

