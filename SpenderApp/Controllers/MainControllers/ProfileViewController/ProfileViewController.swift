//
//  ProfileViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit
import SDWebImage

class ProfileViewController: SubViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        
        return scrollView
    }()
    
    private lazy var profileEditUIView: ProfileEditUIView = {
        let view = ProfileEditUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var myInformationUIView: MyInformationUIView = {
        let view = MyInformationUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var myAccountsUIView: MyAccountsUIView = {
        let view = MyAccountsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
            
    var photoURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(profileEditUIView)
        scrollView.addSubview(myInformationUIView)
        scrollView.addSubview(myAccountsUIView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        profilePictureConfig()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
                        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            profileEditUIView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            profileEditUIView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            profileEditUIView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            profileEditUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 168)),
            
            myInformationUIView.topAnchor.constraint(equalTo: profileEditUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            myInformationUIView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            myInformationUIView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            myInformationUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 480)),
            
            myAccountsUIView.topAnchor.constraint(equalTo: myInformationUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            myAccountsUIView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            myAccountsUIView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            myAccountsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 180))
        ])
    }
    
    private func profilePictureConfig() {
        guard let stringURL = photoURL?.absoluteString else { return }
        if let url = URL(string: stringURL) {
            profileEditUIView.imageView.sd_setImage(with: url, completed: { (image, error, cacheType, imageURL) in
                if let error = error {
                    print("Görüntü indirme hatası: \(error.localizedDescription)")
                } else {
                    print("Görüntü başarıyla indirildi ve görüntülendi")
                }
            })
        }
    }
}
