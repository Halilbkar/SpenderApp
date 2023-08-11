//
//  ProfileEditUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit
import FirebaseAuth

class ProfileEditUIView: UIView {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Name"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 12))
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var editButton: UIButton = {
        var config = UIButton.Configuration.filled()
        
        let buttonTitle = UILabel()
        buttonTitle.text = "Edit Profile"
        buttonTitle.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 16))
        
        config.title = buttonTitle.text
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.cornerStyle = .capsule
        config.buttonSize = .small
        
        let button = UIButton(configuration: config)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(editButton)
        addSubview(nameLabel)
        addSubview(imageView)
        
//        FirebaseDatabaseManager.shared.fetchUserData(imageView: imageView, nameLabel: nameLabel)
        getUserInformation()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 110)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 110)),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            editButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            editButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func getUserInformation() {
        if let currentUser = Auth.auth().currentUser {
            let uid = currentUser.uid
            
            DatabaseManager.shared.getUserInformation(uid: uid) { [self] result in
                switch result {
                case .success(let userInformation):
                    // Kullanıcı bilgileri başarıyla alındı
                    if let userInfo = userInformation {
                        print("Kullanıcı bilgileri: \(userInfo)")
                        // Verileri kullanarak UI'ı güncelleyebilirsiniz
                        
                        guard let image = userInfo.profileImageURL else { return }
                        
                        nameLabel.text = userInfo.firstName
                        imageView.sd_setImage(with: URL(string: image))
                    } else {
                        print("Kullanıcı bilgileri alındı ancak boş.")
                    }
                case .failure(let error):
                    // Kullanıcı bilgileri alınırken hata oluştu
                    print("Kullanıcı bilgileri alınamadı: \(error)")
                }
            }
        }
    }

}
