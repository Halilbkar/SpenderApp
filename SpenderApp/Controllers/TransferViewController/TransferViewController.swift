//
//  TransferViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class TransferViewController: UIViewController {
    
    private lazy var verticalTransfersUIView: VerticalAccountTransfersUIView = {
        let view = VerticalAccountTransfersUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var horizontalTransfersUIView: HorizontalAccountTransfersUIView = {
        let view = HorizontalAccountTransfersUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var recentReicipientsUIView: RecentReicipientsUIView = {
        let view = RecentReicipientsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(verticalTransfersUIView)
        view.addSubview(horizontalTransfersUIView)
        view.addSubview(recentReicipientsUIView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            verticalTransfersUIView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            verticalTransfersUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalTransfersUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            verticalTransfersUIView.heightAnchor.constraint(equalToConstant: 137),
            
            horizontalTransfersUIView.topAnchor.constraint(equalTo: verticalTransfersUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            horizontalTransfersUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            horizontalTransfersUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            horizontalTransfersUIView.heightAnchor.constraint(equalToConstant: 85),
            
            recentReicipientsUIView.topAnchor.constraint(equalTo: horizontalTransfersUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            recentReicipientsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recentReicipientsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recentReicipientsUIView.heightAnchor.constraint(equalToConstant: 102)
        ])
    }

}
