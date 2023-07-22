//
//  FirebaseStorageManager.swift
//  SpenderApp
//
//  Created by Halil Bakar on 22.07.2023.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import SDWebImage

class FirebaseStorageManager {
    
    static let shared = FirebaseStorageManager()
    
    private lazy var storageRef: StorageReference = {
        return Storage.storage().reference().child("profileImages")
    }()
    
    private init() {}
    
    func uploadProfile(_ image: UIImage, withUID uid: String, completion: @escaping (String?, Error?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            completion(nil, NSError(domain: "FirebaseManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid image data."]))
            return
        }
        
        let imageRef = storageRef.child("\(uid).jpg")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        imageRef.putData(imageData, metadata: metadata) { metadata, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            imageRef.downloadURL { url, error in
                if let error = error {
                    completion(nil, error)
                } else {
                    completion(url?.absoluteString, nil)
                }
            }
        }
    }
}

