//
//  TransActionsCollectionViewCell.swift
//  SpenderApp
//
//  Created by Halil Bakar on 1.07.2023.
//

import UIKit

class TransActionsCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "You paid Jonathan for"
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        
        label.text = "The Concert"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "-$25.00"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "06/14"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(paymentLabel)
        addSubview(dateLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 8)),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 8)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 58)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 58)),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat.dWidth(padding: 8)),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 4)),
            descLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat.dWidth(padding: 8)),
            descLabel.trailingAnchor.constraint(equalTo: paymentLabel.leadingAnchor),
            
            paymentLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 4)),
            paymentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
