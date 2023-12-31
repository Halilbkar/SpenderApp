//
//  AuthManager.swift
//  SpenderApp
//
//  Created by Halil Bakar on 8.08.2023.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

enum AuthError: Error {
    case loginError
    case emailNotVerified
    case signUpError
    case sendEmailError
    case passwordResetError
    case googleSignInFailed
    case signOutError
}

protocol AuthManagerProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void)
    func signUp(email: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void)
    func resetPassword(with email: String, completion: @escaping (Result<Void, AuthError>) -> Void)
    func signOut(completion: @escaping (Result<Void, AuthError>) -> Void)
    func signInWithGoogle(completion: @escaping (Result<Void, AuthError>) -> Void)
}

final class AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    private init() {}
}

extension AuthManager: AuthManagerProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error)  in
            if let error = error {
                debugPrint(error)
                completion(.failure(.loginError))
            } else {
//                if let user = result?.user, user.isEmailVerified {
//                    completion(.success(()))
//                } else {
//                    completion(.failure(.emailNotVerified))
//                }
                completion(.success(()))
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<Void, AuthError>) -> Void) {
        auth.createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                debugPrint(error)
                completion(.failure(.signUpError))
            } else {
//                result?.user.sendEmailVerification { error in
//                    if let error = error {
//                        debugPrint(error)
//                        completion(.failure(.sendEmailError))
//                    } else {
//                        completion(.success(()))
//                    }
//                }
                completion(.success(()))
            }
        }
    }
    
    func resetPassword(with email: String, completion: @escaping (Result<Void, AuthError>) -> Void) {
        auth.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                debugPrint(error)
                completion(.failure(.passwordResetError))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func signInWithGoogle(completion: @escaping (Result<Void, AuthError>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
                  return
              }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { [weak self] result, error in
            guard let self else { return }
            if let error {
                debugPrint(error)
            } else {
                guard let user = result?.user,
                      let idToken = user.idToken?.tokenString
                else {
                    return
                }

                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.accessToken.tokenString)
                
                self.auth.signIn(with: credential) { _, error in
                    if let error {
                        debugPrint(error)
                        completion(.failure(.googleSignInFailed))
                    } else {
                        completion(.success(()))
                    }
                }
            }
        }
    }
    
    func signOut(completion: @escaping (Result<Void, AuthError>) -> Void) {
        do {
            try auth.signOut()
            completion(.success(()))
        } catch {
            completion(.failure(.signOutError))
        }
    }
}

