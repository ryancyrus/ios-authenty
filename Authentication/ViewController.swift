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
        
        authView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authView)
        
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
        
        setupConstraints()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupConstraints(){
        
        let authViews: [String: AnyObject] = ["emailField": emailField, "passwordField": passwordField, "loginButton": loginButton]
        let superViews: [String: AnyObject] = ["superview": view, "authView": authView]
        let metrics: [String: Int] = ["standardOffset": 20, "basicHeight": 50, "fieldWidth": Int(authView.frame.width * 0.55), "loginButtonWidth": Int(authView.frame.width * 0.20)]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[superview]-(<=1)-[authView]", options: [.alignAllCenterX], metrics: nil, views: superViews))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[superview]-(<=1)-[authView]", options: [.alignAllCenterY], metrics: nil, views: superViews))
        
        NSLayoutConstraint.activate([authView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
                                     authView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
        
        authView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-standardOffset-[emailField(basicHeight)]-standardOffset-[passwordField(basicHeight)]-standardOffset-[loginButton(basicHeight)]", options: [], metrics: metrics, views: authViews))
        
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
    


}

