//
//  PinnedRecipientsCollectionViewCell.swift
//  SpenderApp
//
//  Created by Halil Bakar on 1.07.2023.
//

import UIKit

class PinnedRecipientsCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = frame.size.width / 2
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
