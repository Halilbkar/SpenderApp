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
    
//    func googleSıgnInConfigure(_ vc: UIViewController) {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//
//        // Create Google Sign In configuration object.
//        let config = GIDConfiguration(clientID: clientID)
//        GIDSignIn.sharedInstance.configuration = config
//
//        // Start the sign in flow!
//
//        GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
//            guard error == nil else {
//                // ...
//                return
//            }
//
//            guard let user = result?.user,
//                  let idToken = user.idToken?.tokenString
//            else {
//                // ...
//                return
//            }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                           accessToken: user.accessToken.tokenString)
//
//            Auth.auth().signIn(with: credential) { result, error in
//
//                if let error = error {
//                    print("Firebase authentication error: \(error.localizedDescription)")
//                    return
//                }
//
//                // Kullanıcı giriş yaptı, burada istediğiniz işlemleri yapabilirsiniz.
//                self.delegate?.singIn()
//            }
//        }
//    }
    
    func googleLogin() {
        AuthManager.shared.signInWithGoogle { result in
            switch result {
            case .success:
                self.delegate?.singIn()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    func userSignIn(to email: String, to password: String) {
//        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
//            if let error = error {
//                // Giriş başarısız oldu, hata mesajını gösterin.
//                print("Firebase authentication error: \(error.localizedDescription)")
//            } else {
//                self.delegate?.singIn()
//            }
//        }
//    }
    
    func login(email: String, password: String) {
        AuthManager.shared.login(email: email, password: password) { result in
            switch result {
            case .success:
                // Kullanıcı kaydı başarılı, gerekli işlemleri yapabilirsiniz
                print("Kullanıcı kaydı başarılı.")
                self.delegate?.singIn()
            case .failure(let error):
                // Kayıt işlemi başarısız, hata ile ilgili işlemleri yapabilirsiniz
                print("Kullanıcı kaydı başarısız: \(error)")
            }
        }
    }
}


