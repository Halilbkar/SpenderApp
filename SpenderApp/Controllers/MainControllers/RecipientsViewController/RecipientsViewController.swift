//
//  RecipientsViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class RecipientsViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.placeholder = "Search Recipients"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }()
    
    private lazy var pinnedReicipientsUIView: PinnedReicipientsUIView = {
        let view = PinnedReicipientsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private lazy var recentRecipientsUIView: RecentRecipientsUIView = {
        let view = RecentRecipientsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var transActionsUIView: TransActionsUIView = {
        let view = TransActionsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(searchBar)
        view.addSubview(pinnedReicipientsUIView)
        view.addSubview(recentRecipientsUIView)
        view.addSubview(transActionsUIView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -165)),
            
            pinnedReicipientsUIView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            pinnedReicipientsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pinnedReicipientsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pinnedReicipientsUIView.heightAnchor.constraint(equalToConstant: 137),

            recentRecipientsUIView.topAnchor.constraint(equalTo: pinnedReicipientsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            recentRecipientsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recentRecipientsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recentRecipientsUIView.heightAnchor.constraint(equalToConstant: 101),
            
            transActionsUIView.topAnchor.constraint(equalTo: recentRecipientsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            transActionsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transActionsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transActionsUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
