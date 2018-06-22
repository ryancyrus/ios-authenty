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

class ViewController: UIViewController, UITextFieldDelegate {
    let authView = UIView()
    let emailField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        authView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authView)
        
        emailField.placeholder = "email"
        emailField.borderStyle = .roundedRect
        emailField.textContentType = UITextContentType.emailAddress
        emailField.isSecureTextEntry = false
        emailField.delegate = self
        authView.addSubview(emailField)

        passwordField.placeholder = "password"
        passwordField.borderStyle = .roundedRect
        passwordField.textContentType = UITextContentType.password
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        authView.addSubview(passwordField)

        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        authView.addSubview(loginButton)
        
        positionAuthViewConstraints(views: ["superview": view, "authView": authView])
        setupConstraintsAuthView(views: ["emailField": emailField, "passwordField": passwordField, "loginButton": loginButton], metrics: ["standardOffset": 20, "basicHeight": 50, "fieldWidth": Int(authView.frame.width * 0.55), "loginButtonWidth": Int(authView.frame.width * 0.20)])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func positionAuthViewConstraints(views: [String: AnyObject]){
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=1)-[authView]", options: [.alignAllCenterX], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=1)-[authView]", options: [.alignAllCenterY], metrics: nil, views: views))
        NSLayoutConstraint.activate([authView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
                                     authView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }
    
    func setupConstraintsAuthView(views: [String: AnyObject], metrics: [String: Int]){
        authView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-standardOffset-[emailField(basicHeight)]-standardOffset-[passwordField(basicHeight)]-standardOffset-[loginButton(basicHeight)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate([emailField.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 0.55),
                                     emailField.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
                                     passwordField.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 0.55),
                                     passwordField.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
                                     loginButton.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 0.20),
                                     loginButton.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
                                     ])
    }
    
    func setupViewConstraints() {
       
        authView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([authView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     authView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     authView.widthAnchor.constraint(equalTo: view.widthAnchor),
                                     authView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35)
            ])
        
        NSLayoutConstraint.activate([emailField.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
                                     emailField.topAnchor.constraint(equalTo: authView.layoutMarginsGuide.topAnchor, constant: 20),
                                     emailField.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 0.55),
                                     emailField.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([passwordField.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
                                     passwordField.topAnchor.constraint(equalTo: emailField.layoutMarginsGuide.bottomAnchor, constant: 20),
                                     passwordField.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 0.55),
                                     passwordField.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([loginButton.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
                                     loginButton.topAnchor.constraint(equalTo: passwordField.layoutMarginsGuide.bottomAnchor, constant: 20),
                                     loginButton.widthAnchor.constraint(equalTo: authView.widthAnchor, multiplier: 0.20),
                                     loginButton.heightAnchor.constraint(equalToConstant: 50)
            ])

    }
    
    
    @objc func pressed(){
        print("pressed")
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func checkErrorsOnEmailInput(email: String) -> String{
        if email.isEmpty{
            
            return "Please enter an email address."
        }else if !isValidEmail(email){
            return "Please enter a valid email address"
        }
        
        return ""
    }
    
    func flagEmail(email:String){
        let error = checkErrorsOnEmailInput(email: email)
        if !error.isEmpty{
            emailField.layer.borderColor = UIColor.red.cgColor
            emailField.layer.borderWidth = 1.0
        }
    }
    
    func flagPassword(password:String){
        if password.isEmpty{
            passwordField.layer.borderColor = UIColor.red.cgColor
            passwordField.layer.borderWidth = 1.0
        }
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            flagEmail(email: emailField.text!)
            self.passwordField.becomeFirstResponder()
        }else{
            flagPassword(password: passwordField.text!)
            self.passwordField.resignFirstResponder()
        }
        return true
    }
    


}

