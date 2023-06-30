//
//  HorizontalAccountTransfersUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class HorizontalAccountTransfersUIView: UIView {
    
    private lazy var transferLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Account Transfers"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Pay"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var recurringButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Request"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var splitButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Split"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()


    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(transferLabel)
        addSubview(stackView)
        
        stackView.addArrangedSubview(payButton)
        stackView.addArrangedSubview(recurringButton)
        stackView.addArrangedSubview(splitButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            transferLabel.topAnchor.constraint(equalTo: topAnchor),
            transferLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            transferLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            stackView.topAnchor.constraint(equalTo: transferLabel.bottomAnchor, constant: .dHeight(padding: 16)),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
