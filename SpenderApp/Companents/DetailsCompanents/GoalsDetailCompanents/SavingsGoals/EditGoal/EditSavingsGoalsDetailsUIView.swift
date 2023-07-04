//
//  EditGoalsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 3.07.2023.
//

import UIKit

class EditSavingsGoalsDetailsUIView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Goal Details"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var startDateTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Last Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var completionDateTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "E-mail"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var notesTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Phone"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var linkTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Street"
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
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(oneStackView)
        
        oneStackView.addArrangedSubview(startDateTextField)
        oneStackView.addArrangedSubview(completionDateTextField)
        oneStackView.addArrangedSubview(notesTextField)
        oneStackView.addArrangedSubview(linkTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 8)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            oneStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            oneStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            oneStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            oneStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }


}
