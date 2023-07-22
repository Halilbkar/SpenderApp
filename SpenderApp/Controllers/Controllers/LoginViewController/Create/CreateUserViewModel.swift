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
}

extension CreateUserViewModel {
    
//    func test(email: String, password: String, firstName: String, lastName: String, profileImage: UIImage) {
//        // Firebase Authentication kullanarak yeni hesap oluşturma
//        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
//            if let error = error {
//                print("HESAP OLUŞTURALAMADI: \(error.localizedDescription)")
//                return
//            }
//
//            // Hesap başarıyla oluşturuldu, kullanıcı verilerini Realtime Database'e kaydedin.
//            let user = Auth.auth().currentUser
//            let uid = user?.uid ?? ""
//            let storageRef = Storage.storage().reference().child("profileImages").child("\(uid).jpg")
//
//            if let imageData = profileImage.jpegData(compressionQuality: 0.1) {
//                storageRef.putData(imageData, metadata: nil) { (metadata, error) in
//                    if let error = error {
//                        print("Profil fotoğrafı yüklenemedi: \(error.localizedDescription)")
//                        return
//                    }
//                    storageRef.downloadURL { (url, error) in
//                        guard let downloadURL = url else {
//                            print("Profil fotoğrafı URL'si alınamadı.")
//                            return
//                        }
//
//                        let userData = [
//                            "email": email,
//                            "firstName": firstName,
//                            "lastName": lastName,
//                            "profileImageURL": downloadURL.absoluteString
//                        ]
//                        Database.database().reference().child("users").child(uid).setValue(userData)
//
//                        self.delegate?.toLogin()
//                    }
//                }
//            }
//        }
//    }
    
    func createUser(email: String, password: String, firstName: String, lastName: String, profileImage: UIImage) {
        FirebaseAccountManager.shared.createUserAccount(email: email, password: password, firstName: firstName, lastName: lastName, profileImage: profileImage) { error in
            if let error = error {
                print("Hesap oluşturalamadı: \(error.localizedDescription)")
            } else {
                print("Hesap başarıyla oluşturuldu.")
                self.delegate?.toLogin()
            }
        }
    }
}
