//
//  CreateUserViewModel.swift
//  SpenderApp
//
//  Created by Halil Bakar on 21.07.2023.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore
import UIKit

protocol CreateUserViewModelDelegate: AnyObject {
    func toLogin()
}

class CreateUserViewModel {
    
    weak var delegate: CreateUserViewModelDelegate?
    
    private let auth = Auth.auth()
}

extension CreateUserViewModel {
    
//    func createUser(email: String, password: String, firstName: String, lastName: String, profileImage: UIImage) {
//        FirebaseAccountManager.shared.createUserAccount(email: email, password: password, firstName: firstName, lastName: lastName, profileImage: profileImage) { error in
//            if let error = error {
//                print("Hesap oluşturalamadı: \(error.localizedDescription)")
//            } else {
//                print("Hesap başarıyla oluşturuldu.")
//                self.delegate?.toLogin()
//            }
//        }
//    }
    
    func signUp(email: String, password: String, firstName: String, lastName: String, profileImage: UIImage) {
        AuthManager.shared.signUp(email: email, password: password) { result in
            switch result {
            case .success:
                // Kullanıcı kaydı başarılı, gerekli işlemleri yapabilirsiniz
                print("Kullanıcı kaydı başarılı.")
                self.save(email: email, firstName: firstName, lastName: lastName, profileImage: profileImage)
                self.delegate?.toLogin()
            case .failure(let error):
                // Kayıt işlemi başarısız, hata ile ilgili işlemleri yapabilirsiniz
                print("Kullanıcı kaydı başarısız: \(error)")
            }
        }
    }
    
    func save(email: String, firstName: String, lastName: String, profileImage: UIImage) {
        
        let uid = Auth.auth().currentUser?.uid ?? ""

        StorageManager.shared.uploadProfileImage(profileImage, withUID: uid) { result in
            switch result {
            case .success(let imageUrl):
                // Profil resminin URL'sini al
                if let profileImageURL = imageUrl {
                    // Kullanıcı bilgilerini Firebase veritabanına kaydet ve profil resmi URL'sini ekleyin
                    DatabaseManager.shared.saveUserInfo(uid: uid, email: email, firstName: firstName, lastName: lastName, profileImageURL: profileImageURL) { error in
                        if let error = error {
                            print("Kullanıcı bilgileri kaydedilirken hata oluştu: \(error)")
                        } else {
                            print("Kullanıcı bilgileri ve profil resmi başarıyla kaydedildi.")
                        }
                    }
                }
            case .failure(let error):
                print("Profil resmi yüklenirken hata oluştu: \(error)")
            }
        }
    }
}
