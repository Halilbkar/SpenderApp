////
////  StorageManager.swift
////  SpenderApp
////
////  Created by Halil Bakar on 26.07.2023.
////
//
//import Foundation
//import UIKit
//import FirebaseStorage
//
//enum StorageError: Error {
//    case uploadError
//    case downloadError
//    case deleteError
//    // Diğer hata durumları buraya eklenebilir.
//}
//
//protocol StorageManagerProtocol {
//    func uploadImage(_ image: UIImage, completion: @escaping (Result<URL, StorageError>) -> Void)
//    func downloadImage(from url: URL, completion: @escaping (Result<UIImage?, StorageError>) -> Void)
//    func deleteImage(at url: URL, completion: @escaping (Result<Void, StorageError>) -> Void)
//}
//
//final class StorageManager {
//    
//    static let shared = StorageManager()
//    private let storage = Storage.storage()
//    
//    private init() {}
//}
//
//extension StorageManager: StorageManagerProtocol {
//    
//    func uploadProfileImage(_ image: UIImage, withUID uid: String, completion: @escaping (Result<URL?, StorageError>) -> Void) {
//            let imageName = "\(uid)_profile_image.jpg"
//            guard let imageData = image.jpegData(compressionQuality: 0.8) else {
//                completion(.failure(.uploadError))
//                return
//            }
//            
//            let storageRef = storage.reference().child("profile_images").child(imageName)
//            let metadata = StorageMetadata()
//            metadata.contentType = "image/jpeg"
//            
//            let uploadTask = storageRef.putData(imageData, metadata: metadata) { metadata, error in
//                if let error = error {
//                    debugPrint(error)
//                    completion(.failure(.uploadError))
//                } else {
//                    storageRef.downloadURL { url, error in
//                        if let error = error {
//                            debugPrint(error)
//                            completion(.failure(.uploadError))
//                        } else {
//                            completion(.success(url))
//                        }
//                    }
//                }
//            }
//            
//            // İlerleme durumunu takip etmek isterseniz kullanabilirsiniz.
//            uploadTask.observe(.progress) { snapshot in
//                // snapshot.progress.completedUnitCount ve snapshot.progress.totalUnitCount değerlerini kullanabilirsiniz.
//            }
//        }
//    
//    func uploadImage(_ image: UIImage, completion: @escaping (Result<URL, StorageError>) -> Void) {
//        // Özel bir isim oluşturabilir veya rastgele bir isimle Firebase Storage'a yükleyebilirsiniz.
//        let imageName = "\(UUID().uuidString).jpg"
//        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
//            completion(.failure(.uploadError))
//            return
//        }
//        
//        let storageRef = storage.reference().child("images").child(imageName)
//        let metadata = StorageMetadata()
//        metadata.contentType = "image/jpeg"
//        
//        let uploadTask = storageRef.putData(imageData, metadata: metadata) { metadata, error in
//            if let error = error {
//                debugPrint(error)
//                completion(.failure(.uploadError))
//            } else {
//                storageRef.downloadURL { url, error in
//                    if let error = error {
//                        debugPrint(error)
//                        completion(.failure(.uploadError))
//                    } else if let downloadURL = url {
//                        completion(.success(downloadURL))
//                    } else {
//                        completion(.failure(.uploadError))
//                    }
//                }
//            }
//        }
//        
//        // İlerleme durumunu takip etmek isterseniz kullanabilirsiniz.
//        uploadTask.observe(.progress) { snapshot in
//            // snapshot.progress.completedUnitCount ve snapshot.progress.totalUnitCount değerlerini kullanabilirsiniz.
//        }
//    }
//    
//    func downloadImage(from url: URL, completion: @escaping (Result<UIImage?, StorageError>) -> Void) {
//        let storageRef = storage.reference(forURL: url.absoluteString)
//        
//        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if let error = error {
//                debugPrint(error)
//                completion(.failure(.downloadError))
//            } else if let imageData = data, let image = UIImage(data: imageData) {
//                completion(.success(image))
//            } else {
//                completion(.failure(.downloadError))
//            }
//        }
//    }
//    
//    func deleteImage(at url: URL, completion: @escaping (Result<Void, StorageError>) -> Void) {
//        let storageRef = storage.reference(forURL: url.absoluteString)
//        
//        storageRef.delete { error in
//            if let error = error {
//                debugPrint(error)
//                completion(.failure(.deleteError))
//            } else {
//                completion(.success(()))
//            }
//        }
//    }
//}
