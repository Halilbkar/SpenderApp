//
//  MainViewModel.swift
//  SpenderApp
//
//  Created by Halil Bakar on 23.07.2023.
//

import Foundation
import UIKit

class MainViewModel {
    
    lazy var dataSource = MainDataSource()
}

extension MainViewModel {
    func fetchUserData(nameLabel: UILabel, imageView: UIImageView) {
//        FirebaseDatabaseManager.shared.fetchUserData { success, firstName, lastName, profileImageURL in
//            if success {
//                // Kullanıcının adını soyadını gösterme
//                nameLabel.text = "\(firstName ?? "") \(lastName ?? "")"
//
//                // Kullanıcının profil fotoğrafını indirme
//                if let url = URL(string: profileImageURL ?? "") {
//                    imageView.sd_setImage(with: url, completed: nil)
//                }
//            } else {
//                // Veri çekilemediğinde yapılacak işlemler
//                print("Veri çekilemedi.")
//            }
//        }
        
        FirebaseDatabaseManager.shared.fetchUserData(imageView: imageView, nameLabel: nameLabel)
    }
}
