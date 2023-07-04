//
//  EditSavingsSelectAccountUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 3.07.2023.
//

import UIKit

class EditSavingsSelectAccountUIView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Select Account"
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
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(startDateTextField)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 8)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            startDateTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            startDateTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            startDateTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            startDateTextField.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 40))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
