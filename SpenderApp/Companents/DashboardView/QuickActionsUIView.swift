//
//  QuickActionsUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

class QuickActionsUIView: UIView {
    
    private lazy var quickActionsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Quick Actions"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var payBillsButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .mini
        button.configuration?.title = "Pay Bills"
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.baseForegroundColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var sendMoneyButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .mini
        button.configuration?.title = "Send Money"
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.baseForegroundColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var requestMoneyButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .mini
        button.configuration?.title = "Request Money"
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.baseForegroundColor = .white
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
   
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(quickActionsLabel)
        addSubview(stackView)
        
        stackView.addArrangedSubview(payBillsButton)
        stackView.addArrangedSubview(sendMoneyButton)
        stackView.addArrangedSubview(requestMoneyButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            quickActionsLabel.topAnchor.constraint(equalTo: topAnchor),
            quickActionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            quickActionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            stackView.topAnchor.constraint(equalTo: quickActionsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
