//
//  CreateGoalTwo.swift
//  SpenderApp
//
//  Created by Halil Bakar on 3.07.2023.
//

import UIKit

class CreateGoalTwo: MainCreateGoal {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Money Breakdown"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var startDateTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
        
        textField.placeholder = "Last Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Account"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var savingsButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.configuration?.title = "Savings"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var checkingButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.configuration?.title = "Checking"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(startDateTextField)
        addSubview(accountLabel)
        addSubview(savingsButton)
        addSubview(checkingButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            startDateTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            startDateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            startDateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            startDateTextField.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40)),
            
            accountLabel.topAnchor.constraint(equalTo: startDateTextField.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            accountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            accountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            savingsButton.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            savingsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            savingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            savingsButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40)),
            
            checkingButton.topAnchor.constraint(equalTo: savingsButton.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            checkingButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            checkingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            checkingButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
