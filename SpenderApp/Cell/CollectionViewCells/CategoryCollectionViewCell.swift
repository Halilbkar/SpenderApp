//
//  CategoryCollectionViewCell.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Auto + Gas"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var ratioLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Down 4%"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(ratioLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: ratioLabel.leadingAnchor),
            
            ratioLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            ratioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            ratioLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
