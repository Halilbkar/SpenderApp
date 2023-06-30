//
//  PayeesCollectionViewCell.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class PayeesCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Amazon Credit Card • 9571"
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Amazon Credit Card"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var paymentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Scheduled $170.74 - Nov 01"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .white
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(paymentLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 12)),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 12)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 48)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 48)),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 12)),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat.dWidth(padding: 12)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -12)),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 2)),
            descLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat.dWidth(padding: 12)),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -12)),
            
            paymentLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            paymentLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat.dWidth(padding: 12)),
            paymentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -12)),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
