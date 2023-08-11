//
//  MainViewModel.swift
//  SpenderApp
//
//  Created by Halil Bakar on 23.07.2023.
//

import Foundation
import UIKit
import FirebaseAuth

protocol MainViewModelDelegate: AnyObject {
    func fetchUser(name: String, profileImageURL: String)
}

class MainViewModel {
    
    lazy var dataSource = MainDataSource()
    
    weak var delegate: MainViewModelDelegate?
}

extension MainViewModel {
//    func fetchUserData() {
//        FirebaseDatabaseManager.shared.fetchUserData { firstName, lastName, profileImageURL in
//            guard let name = firstName, let imageUrl = profileImageURL else { return }
//            self.delegate?.fetchUser(name: name, profileImageURL: imageUrl)
//        }
//    }
    
    func getUserData() {
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
                        
                        self.delegate?.fetchUser(name: userInfo.firstName, profileImageURL: image)
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
