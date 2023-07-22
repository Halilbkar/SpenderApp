//
//  ViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 25.06.2023.
//

import UIKit
import GoogleSignIn

class SplashViewController: UIViewController {
    
    private lazy var splahImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(splahImageView)
        
        setupLogoImageView()
        animateLogo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            splahImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 240)),
            splahImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 109)),
            splahImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -82)),
            splahImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat.dHeight(padding: -388))
        ])
    }
    
    private func setupLogoImageView() {
        var logoImages: [UIImage] = []
        
        for i in 1...19 {
            if let logoImage = UIImage(named: "animation stage=\(i)") {
                logoImages.append(logoImage)
            }
        }
        
        splahImageView.animationImages = logoImages
        splahImageView.animationDuration = 2
        splahImageView.animationRepeatCount = 1
    }
    
    private func animateLogo() {
        splahImageView.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + splahImageView.animationDuration) {
            self.stopAnimatingLogo()
        }
    }
    
    private func stopAnimatingLogo() {
        splahImageView.stopAnimating()
        splahImageView.image = splahImageView.animationImages?.last
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigateToNextScreen()
        }
    }
    
    private func navigateToNextScreen() {
        
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}

