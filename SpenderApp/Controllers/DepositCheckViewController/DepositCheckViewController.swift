//
//  DepositCheckViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class DepositCheckViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "leaves")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    private lazy var dollarLabel: UILabel = {
        let label = UILabel()
        
        label.text = "$12.900"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 48))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        
        label.text = "CURRENT Deposit Limit"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 48))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var depositButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = "Make a Deposit"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(imageView)
        view.addSubview(dollarLabel)
        view.addSubview(descLabel)
        view.addSubview(depositButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 72)),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 72)),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -72)),
            
            dollarLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            dollarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 93)),
            dollarLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -93)),
            
            descLabel.topAnchor.constraint(equalTo: dollarLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            descLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 109)),
            descLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -109)),
            
            depositButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            depositButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 81.5)),
            depositButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -81.5))
        ])
    }
}
