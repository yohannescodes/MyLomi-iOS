//
//  LoginViewController.swift
//  MyLomi
//
//  Created by Yohannes on 5/11/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        let text = "Welcome to \nMyLomi"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "AccentColor") ?? UIColor.red, range: NSRange(location: 12, length: 6))
        label.attributedText = attributedString
        label.font = .systemFont(ofSize: 42, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let phoneNumberField: MyLomiTextField = {
        let textField = MyLomiTextField()
        textField.placeholder = "Phone Number"
        textField.layer.cornerRadius = 30
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .phonePad
        textField.leftViewMode = .always
        textField.leftImage = UIImage(systemName: "phone")
        textField.leftPadding = 21
        return textField
    }()
    
    private let passwordTextField: MyLomiTextField = {
        let textField = MyLomiTextField()
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 30
        textField.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.leftViewMode = .always
        textField.leftImage = UIImage(systemName: "lock")
        textField.leftPadding = 21
        return textField
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "Forgot password?"
        label.textColor = .black
        return label
    }()
    
    private let loginBtn: MyLomiButton = {
        let button = MyLomiButton()
        button.backgroundColor = UIColor(named: "AccentColor")
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 30
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        applyConstraints()
    }
    
    private func setUpViews(){
        self.title = "Login"
        view.backgroundColor = .systemBackground
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.addSubview(welcomeLabel)
        view.addSubview(phoneNumberField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordLabel)
        loginBtn.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        view.addSubview(loginBtn)
    }
    
    private func applyConstraints(){
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let welcomeConstraints = [
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.bounds.width - 342)/2),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 342),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 104)
        ]
        
        let emailConstraints = [
            phoneNumberField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 110),
            phoneNumberField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.bounds.width - 342)/2),
            phoneNumberField.widthAnchor.constraint(equalToConstant: 342),
            phoneNumberField.heightAnchor.constraint(equalToConstant: 61)
        ]
        
        let passwordConstraints = [
            passwordTextField.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 24),
            passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.bounds.width - 342)/2),
            passwordTextField.widthAnchor.constraint(equalToConstant: 342),
            passwordTextField.heightAnchor.constraint(equalToConstant: 61)
        ]
        
        let forgotConstraints = [
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12),
            forgotPasswordLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            forgotPasswordLabel.widthAnchor.constraint(equalToConstant: 116),
            forgotPasswordLabel.heightAnchor.constraint(equalToConstant: 19)
        ]
        
        let loginBtnConstraints = [
            loginBtn.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 28),
            loginBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.bounds.width - 342)/2),
            loginBtn.widthAnchor.constraint(equalToConstant: 342),
            loginBtn.heightAnchor.constraint(equalToConstant: 61)
        ]
        
        
        NSLayoutConstraint.activate(welcomeConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(forgotConstraints)
        NSLayoutConstraint.activate(loginBtnConstraints)
        
    }
    
    private func goExplore(){
        let mainTabBarC = MainTabBarController()
        mainTabBarC.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(mainTabBarC, animated: true)
    }
    
    @objc func didTapLogin(){
        loginBtn.shakeButton()
        self.goExplore()
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
