//
//  CreditUICollectionViewCell.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

class CreditUICollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Home Depot"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var currentBalanceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "CurrentBalance"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dollarsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "$1000"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var nextPaymentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Next Payment:"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Aug 30"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(currentBalanceLabel)
        contentView.addSubview(dollarsLabel)
        
        contentView.addSubview(nextPaymentLabel)
        contentView.addSubview(dateLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            currentBalanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            currentBalanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            currentBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            dollarsLabel.topAnchor.constraint(equalTo: currentBalanceLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 4)),
            dollarsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            dollarsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            nextPaymentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            nextPaymentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            nextPaymentLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: CGFloat.dWidth(padding: 4)),
            
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
