//
//  CreateUserViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 14.07.2023.
//

import UIKit

class CreateUserViewController: UIViewController {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "welcomeLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Create User"
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Username"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.addLeftPadding(textField: textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

    private lazy var passTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.addLeftPadding(textField: textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
                
        return textField
    }()
    
    private lazy var tryPassTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Try Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.addLeftPadding(textField: textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
                
        return textField
    }()

    private lazy var oneStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .gray
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = "Create Account"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(imageView)
        view.addSubview(loginLabel)
        view.addSubview(oneStackView)
        view.addSubview(createAccountButton)
        
        oneStackView.addArrangedSubview(userNameTextField)
        oneStackView.addArrangedSubview(passTextField)
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 88)),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 64)),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -64)),
            
            loginLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            oneStackView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 12)),
            oneStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            oneStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            oneStackView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 100)),
            
            createAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat.dHeight(padding: -48)),
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 83)),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -83)),
        ])
    }
    
    @objc private func createButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
