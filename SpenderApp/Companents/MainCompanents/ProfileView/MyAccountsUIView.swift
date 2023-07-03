//
//  MyAccountsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit

class MyAccountsUIView: UIView {
    
    private lazy var myAccountsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "My Accounts"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var addAccountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "+ Add Account"
        label.font = .boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkingTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Checking Card Number"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var savingsTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Savings Card Number"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
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
    
    private lazy var completedButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = "Completed"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(myAccountsLabel)
        addSubview(addAccountLabel)
        addSubview(oneStackView)
        addSubview(completedButton)
        
        oneStackView.addArrangedSubview(checkingTextField)
        oneStackView.addArrangedSubview(savingsTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            myAccountsLabel.topAnchor.constraint(equalTo: topAnchor),
            myAccountsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            myAccountsLabel.trailingAnchor.constraint(equalTo: addAccountLabel.leadingAnchor),
            
            addAccountLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 8)),
            addAccountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            oneStackView.topAnchor.constraint(equalTo: myAccountsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            oneStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            oneStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            oneStackView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 100)),
            
            completedButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            completedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            completedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
