//
//  RegisterViewController.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 11.10.2022.
//

import UIKit
import Combine


class RegisterViewController: UIViewController {

    private var viewModel = RegisterViewViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    
    private let registerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.text = "Create your account"
        return label
    }()
    
    private let emailTextField: UITextField = {
       let textfield = UITextField()
        textfield.keyboardType = .emailAddress
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
       let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.isSecureTextEntry = true
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        return textfield
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.isEnabled = false
        button.layer.cornerRadius = 25
    
        return button
    }()
    
    //when we tapped outside the keyboard, keyboard is dismissed
    @objc private func didTapToDismiss() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(registerTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField )
        view.addSubview(registerButton)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        configureConstraints()
        bindViews()
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
    }
    
    
    @objc private func didTapRegister() {
        viewModel.createUser()
    }
    
    private func bindViews() {
        emailTextField.addTarget(self, action: #selector(didChangeEmail), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangePassword), for: .editingChanged)
        viewModel.$isRegistrationFormValid.sink {  [weak self] validationState in
            self?.registerButton.isEnabled = validationState
            
        }.store(in: &subscriptions)
        viewModel.$user.sink { [weak self] user in
            print(user)
        }
        .store(in: &subscriptions)
    }
    
    @objc private func didChangeEmail() {
        viewModel.email = emailTextField.text
        viewModel.validateRegistrationForm()
    }
         
    @objc private func didChangePassword() {
        viewModel.password = passwordTextField.text
        viewModel.validateRegistrationForm()
    }
    
    private func configureConstraints() {
        let registerTitleConsts = [
            registerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20)]
        
        let emailTFConsts = [
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            emailTextField.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor,constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 60)]
        
        let passwordTFConsts = [
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant:view.frame.width - 40),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60)]
        
        let registerButtonConsts = [
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            registerButton.widthAnchor.constraint(equalToConstant: 180),
            registerButton.heightAnchor.constraint(equalToConstant: 50)]
        
        
        NSLayoutConstraint.activate(registerTitleConsts)
        NSLayoutConstraint.activate(emailTFConsts)
        NSLayoutConstraint.activate(passwordTFConsts)
        NSLayoutConstraint.activate(registerButtonConsts)
    }


}
