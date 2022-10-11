//
//  OnboardingViewController.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 11.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "See whats happening in the world right now"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private let createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let promptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .gray
        label.text = "Have an account already?"
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return label
        
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(createButton)
        view.addSubview(promptLabel)
        view.addSubview(loginButton)
        configureConstraints()
    
    }

    private func configureConstraints() {
        let welcomeLabelConsts = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor) ]
        
        let createButtonConsts = [
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.heightAnchor.constraint(equalToConstant: 60),
            createButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 20),
            createButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor,constant: -20)]
        
        let promptLabelConsts = [
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            promptLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -60 )]
        
        let loginButtonConsts = [
            loginButton.centerYAnchor.constraint(equalTo: promptLabel.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: promptLabel.trailingAnchor,constant: 10)]
        
        NSLayoutConstraint.activate(welcomeLabelConsts)
        NSLayoutConstraint.activate(createButtonConsts)
        NSLayoutConstraint.activate(promptLabelConsts)
        NSLayoutConstraint.activate(loginButtonConsts)
    }
    

}
