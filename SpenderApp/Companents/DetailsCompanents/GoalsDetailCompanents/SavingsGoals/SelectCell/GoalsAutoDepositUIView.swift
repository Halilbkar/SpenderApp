//
//  GoalsAutoDepositUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit

class GoalsAutoDepositUIView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Goal Details"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "City"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var stateTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "State"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var oneStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .systemGray6

        addSubview(titleLabel)
        addSubview(oneStackView)
        
        oneStackView.addArrangedSubview(cityTextField)
        oneStackView.addArrangedSubview(stateTextField)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 8)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
        
            oneStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 20)),
            oneStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            oneStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            oneStackView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40)),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
