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
        setupAuthViewConstraints(authView: authView, parentView: view)
        
        
        emailField.placeholder = "email"
        emailField.borderStyle = .roundedRect
        emailField.textContentType = UITextContentType.emailAddress
        emailField.isSecureTextEntry = false
        
        authView.addSubview(emailField)
        setupAuthViewFieldsConstraints(textField: emailField, parentView: authView)
        
        
        passwordField.placeholder = "password"
        passwordField.borderStyle = .roundedRect
        passwordField.textContentType = UITextContentType.password
        passwordField.isSecureTextEntry = true
        
        authView.addSubview(passwordField)
        setupAuthViewPasswordFieldConstraints(textField: passwordField, parentView: authView)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        authView.addSubview(loginButton)
        setupAuthViewSubmitButtonConstraints(button: loginButton)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupAuthViewConstraints(authView: UIView, parentView: UIView) {
        authView.translatesAutoresizingMaskIntoConstraints = false
        
        let authViewCenterX = NSLayoutConstraint(item: authView, attribute: .centerX, relatedBy: .equal, toItem: parentView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let authViewCenterY = NSLayoutConstraint(item: authView, attribute: .centerY, relatedBy: .equal, toItem: parentView, attribute: .centerY, multiplier: 1.0, constant: 0)
        let authViewHeight = NSLayoutConstraint(item: authView, attribute: .height, relatedBy: .equal, toItem: parentView, attribute: .height, multiplier: 0.35, constant: 0)
        let authViewWidth = NSLayoutConstraint(item: authView, attribute: .width, relatedBy: .equal, toItem: parentView, attribute: .width, multiplier: 1.0, constant: 0)
        
        view.addConstraints([authViewCenterX, authViewCenterY, authViewWidth, authViewHeight])
    }
    
    func setupAuthViewFieldsConstraints(textField: UITextField, parentView: UIView){
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldCenterX = NSLayoutConstraint(item: textField, attribute: .centerX, relatedBy: .equal, toItem: parentView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let textFieldTopSpace = NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: parentView, attribute: .topMargin, multiplier: 1.0, constant: 20)
        let textFieldWidth = NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: parentView, attribute: .width, multiplier: 0.55, constant: 0)
        let textFieldHeight = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        
        parentView.addConstraints([textFieldCenterX, textFieldTopSpace, textFieldWidth, textFieldHeight])
        
        
    }
    
    func setupAuthViewPasswordFieldConstraints(textField: UITextField, parentView: UIView){
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldCenterX = NSLayoutConstraint(item: textField, attribute: .centerX, relatedBy: .equal, toItem: parentView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let textFieldTopSpace = NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: emailField, attribute: .bottomMargin, multiplier: 1.0, constant: 20)
        let textFieldWidth = NSLayoutConstraint(item: textField, attribute: .width, relatedBy: .equal, toItem: parentView, attribute: .width, multiplier: 0.55, constant: 0)
        let textFieldHeight = NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        
        parentView.addConstraints([textFieldCenterX, textFieldTopSpace, textFieldWidth, textFieldHeight])
        
        
    }
    func setupAuthViewSubmitButtonConstraints(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonCenterX = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: authView, attribute: .centerX, multiplier: 1.0, constant: 0)
        let buttonTopSpace = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: passwordField, attribute: .bottomMargin, multiplier: 1.0, constant: 20)
        let buttonWidth = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: authView, attribute: .width, multiplier: 0.20, constant: 0)
        let buttonHeight = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 50)
        
        authView.addConstraints([buttonCenterX, buttonTopSpace, buttonWidth, buttonHeight])
    }
    
    @objc func pressed(){
        print("pressed")
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }

}

