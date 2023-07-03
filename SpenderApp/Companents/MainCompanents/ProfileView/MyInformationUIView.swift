//
//  MyInformationUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit

class MyInformationUIView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "My Information"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "First Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var genderTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Gender"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Last Name"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "E-mail"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Phone"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var streetTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Street"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "City"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var stateTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "State"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var zipTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "ZIP"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
        return textField
    }()
    
    private lazy var apartmentTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Apartment"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addLeftPadding(textField: textField)
        
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
    
    private lazy var twoStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var threeStackView: UIStackView = {
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
        
        addSubview(titleLabel)
        addSubview(firstNameTextField)
        addSubview(genderTextField)
        
        addSubview(oneStackView)
        
        oneStackView.addArrangedSubview(lastNameTextField)
        oneStackView.addArrangedSubview(emailTextField)
        oneStackView.addArrangedSubview(phoneTextField)
        oneStackView.addArrangedSubview(streetTextField)
        
        addSubview(twoStackView)
        
        twoStackView.addArrangedSubview(cityTextField)
        twoStackView.addArrangedSubview(stateTextField)
        
        addSubview(threeStackView)
        
        threeStackView.addArrangedSubview(zipTextField)
        threeStackView.addArrangedSubview(apartmentTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
        
            firstNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            firstNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            firstNameTextField.trailingAnchor.constraint(equalTo: genderTextField.leadingAnchor, constant: CGFloat.dWidth(padding: -16)),
            firstNameTextField.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 44)),
            
            genderTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            genderTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dHeight(padding: -16)),
            genderTextField.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 44)),
            
            oneStackView.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: CGFloat.dHeight(padding: 20)),
            oneStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            oneStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            oneStackView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 236)),
            
            twoStackView.topAnchor.constraint(equalTo: oneStackView.bottomAnchor, constant: CGFloat.dHeight(padding: 20)),
            twoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            twoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            twoStackView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40)),
            
            threeStackView.topAnchor.constraint(equalTo: twoStackView.bottomAnchor, constant: CGFloat.dHeight(padding: 20)),
            threeStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            threeStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            threeStackView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40))

        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
