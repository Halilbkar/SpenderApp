//
//  ProfileEditUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit

class ProfileEditUIView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
         
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(editButton)
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 127.5)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 120)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 120)),
            
            editButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 145.5)),
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -145.5)),
            editButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -12))
        ])
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
