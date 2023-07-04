//
//  EditTransferUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 3.07.2023.
//

import UIKit

class EditTransferUIView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Transfer"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var depositButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.configuration?.title = "Transfer Funds"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var pinButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.configuration?.title = "Pin Goal"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .blue
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = "Save Settings"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(depositButton)
        addSubview(pinButton)
        addSubview(saveButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 8)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            depositButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            depositButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            depositButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            depositButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 32)),
            
            saveButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -24)),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 83)),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -83)),
            
            pinButton.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: CGFloat.dHeight(padding: -24)),
            pinButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 83)),
            pinButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -83)),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
