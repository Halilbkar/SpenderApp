//
//  LoginViewModel.swift
//  SpenderApp
//
//  Created by Halil Bakar on 14.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

protocol LoginViewModelDelegate: AnyObject {
    func singIn()
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelDelegate?
    
}

extension LoginViewModel {
    
    func googleSıgnInConfigure(_ vc: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        
        GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
            guard error == nil else {
                // ...
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                // ...
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                
                if let error = error {
                    print("Firebase authentication error: \(error.localizedDescription)")
                    return
                }
                
                // Kullanıcı giriş yaptı, burada istediğiniz işlemleri yapabilirsiniz.
                self.delegate?.singIn()
            }
        }
    }
    
    func userSignIn(to email: String, to password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Giriş başarısız oldu, hata mesajını gösterin.
                print("Firebase authentication error: \(error.localizedDescription)")
            } else {
                self.delegate?.singIn()
            }
        }
    }
    
    func currentUser() {
        if Auth.auth().currentUser != nil {
            self.delegate?.singIn()
        }
    }
}


