//
//  ProfileViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit
import SDWebImage

class MainProfileUIView: CommonUIView {
    
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
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor(named: "grey100")
        
        addSubview(scrollView)
        
        scrollView.addSubview(profileEditUIView)
        scrollView.addSubview(myInformationUIView)
        scrollView.addSubview(myAccountsUIView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.contentSize = CGSize(width: frame.size.width, height: 1000)
                        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
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
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
