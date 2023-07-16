//
//  QuickActionsCollectionViewCell.swift
//  SpenderApp
//
//  Created by Halil Bakar on 7.07.2023.
//

import UIKit

class QuickActionsCollectionViewCell: UICollectionViewCell {
    
    private lazy var actionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Test"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 12))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .black
        layer.cornerRadius = 12
        
        addSubview(actionLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        actionLabel.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
