//
//  BankingCollectionViewCell.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

class BankingCollectionViewCell: UICollectionViewCell {
    
    private lazy var checkingLabel: UILabel = {
        let label = UILabel()
        
        label.text = "CHECKING"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var checkingNumberLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1234"
        label.font = .systemFont(ofSize: 12)
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

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .white
        
        contentView.addSubview(checkingLabel)
        contentView.addSubview(checkingNumberLabel)
        contentView.addSubview(dollarsLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            checkingLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            checkingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            checkingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            
            checkingNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            checkingNumberLabel.leadingAnchor.constraint(equalTo: checkingLabel.trailingAnchor, constant: CGFloat.dWidth(padding: 8)),
            checkingNumberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16)),

            dollarsLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            dollarsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            dollarsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16)),

        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
