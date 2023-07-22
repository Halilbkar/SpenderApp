//
//  FirebaseAccountManager.swift
//  SpenderApp
//
//  Created by Halil Bakar on 22.07.2023.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class FirebaseAccountManager {
    
    static let shared = FirebaseAccountManager()
    
    private lazy var databaseRef: DatabaseReference = {
        return Database.database().reference()
    }()
    
    private init() {}
    
    func createUserAccount(email: String, password: String, firstName: String, lastName: String, profileImage: UIImage, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (authResult, error) in
            if let error = error {
                completion(error)
                return
            }
            
            guard let self = self, let user = authResult?.user else {
                completion(nil)
                return
            }
            
            let uid = user.uid
            FirebaseStorageManager.shared.uploadProfile(profileImage, withUID: uid) { imageUrl, error in
                if let error = error {
                    completion(error)
                    return
                }
                
                let userData = [
                    "email": email,
                    "firstName": firstName,
                    "lastName": lastName,
                    "profileImageURL": imageUrl ?? ""
                ]
                self.databaseRef.child("users").child(uid).setValue(userData)
                
                completion(nil)
            }
        }
    }
    
    
}
