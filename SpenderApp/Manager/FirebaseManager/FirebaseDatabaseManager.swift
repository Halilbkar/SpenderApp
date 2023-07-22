//
//  FirebaseAccountManager.swift
//  SpenderApp
//
//  Created by Halil Bakar on 22.07.2023.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import SDWebImage

class FirebaseDatabaseManager {
    
    static let shared = FirebaseDatabaseManager()
    
    private init() {}
        
    func saveUserToDatabase(user: User) {
        let databaseRef = Database.database().reference().child("users")
        let userRef = databaseRef.childByAutoId()
        
        let userData: [String: Any] = [
            "firstName": user.firstName,
            "lastName": user.lastName,
            "profilePhotoURL": user.profileImageURL
        ]
        
        userRef.setValue(userData) { (error, ref) in
            if let error = error {
                print("Error occurred while saving user: \(error.localizedDescription)")
            } else {
                print("User successfully saved.")
            }
        }
    }
    
//    func fetchUserData(completion: @escaping (Bool, String?, String?, String?) -> Void) {
//        guard let currentUser = Auth.auth().currentUser else {
//            completion(false, nil, nil, nil)
//            return
//        }
//
//        let userRef = Database.database().reference().child("users").child(currentUser.uid)
//
//        userRef.observeSingleEvent(of: .value) { (snapshot, error) in
//            guard let userData = snapshot.value as? [String: Any],
//                  let firstName = userData["firstName"] as? String,
//                  let lastName = userData["lastName"] as? String,
//                  let profileImageURL = userData["profilePhotoURL"] as? String else {
//                // Veri çekilemedi, hata durumunu işleme alın.
//                completion(false, nil, nil, nil)
//                return
//            }
//
//            // Verileri başarıyla çektik, completion ile döndürelim
//            completion(true, firstName, lastName, profileImageURL)
//        }
//    }
    
    func fetchUserData(imageView: UIImageView, nameLabel: UILabel) {
        guard let currentUser = Auth.auth().currentUser else {
            // Kullanıcı oturum açmamışsa işlem yapma.
            return
        }

        // Kullanıcının verilerini çekmek için DatabaseReference oluşturun.
        let userRef = Database.database().reference().child("users").child(currentUser.uid)

        // DatabaseReference'den kullanıcı verilerini çekmek için observeSingleEventOfType metodunu kullanın.
        userRef.observeSingleEvent(of: .value) { (snapshot, error) in
            guard let userData = snapshot.value as? [String: Any],
                  let firstName = userData["firstName"] as? String,
                  let lastName = userData["lastName"] as? String,
                  let profileImageURL = userData["profileImageURL"] as? String else {
                // Veri çekilemedi, hata durumunu işleme alın.
                return
            }
            
            nameLabel.text = "\(firstName) \(lastName)"
            
            // Kullanıcının profil fotoğrafını indirme
            if let url = URL(string: profileImageURL) {
                imageView.sd_setImage(with: url)
            }
        }
    }
}



