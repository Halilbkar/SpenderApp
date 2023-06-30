//
//  SpendingGoalsCollectionViewCell.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class SpendingGoalsCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Restaurants"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dollarLabel: UILabel = {
        let label = UILabel()
        
        label.text = "$80"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var spendLabel: UILabel = {
        let label = UILabel()
        
        label.text = "$20 Spend"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        
        label.text = "$60 Left"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        
        progressBar.trackTintColor = .systemGray3
        progressBar.progressTintColor = .green
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.setProgress(1/8, animated: true)
        
        return progressBar
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(dollarLabel)
        addSubview(spendLabel)
        addSubview(leftLabel)
        addSubview(progressBar)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 12)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 12)),
            titleLabel.trailingAnchor.constraint(equalTo: dollarLabel.leadingAnchor),
            
            dollarLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 12)),
            dollarLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -38)),
            
            progressBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 12)),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -38)),
            progressBar.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 20)),
            
            spendLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .dHeight(padding: -12)),
            spendLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 12)),
            
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -12)),
            leftLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -12))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
