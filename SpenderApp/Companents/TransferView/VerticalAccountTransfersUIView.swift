//
//  AccountTransfersUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class VerticalAccountTransfersUIView: UIView {
    
    private lazy var transferLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Account Transfers"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var oneTimeButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "One Time Only"
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
        button.configuration?.title = "Recurring Transfer"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()    

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear

        
        addSubview(transferLabel)
        addSubview(oneTimeButton)
        addSubview(recurringButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            transferLabel.topAnchor.constraint(equalTo: topAnchor),
            transferLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            transferLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            oneTimeButton.topAnchor.constraint(equalTo: transferLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            oneTimeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            oneTimeButton.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 238)),
            oneTimeButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 44)),
            
            recurringButton.topAnchor.constraint(equalTo: oneTimeButton.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            recurringButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            recurringButton.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 238)),
            recurringButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 44))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
