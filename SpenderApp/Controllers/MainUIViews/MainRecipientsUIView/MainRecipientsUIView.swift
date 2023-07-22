//
//  RecipientsViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class MainRecipientsUIView: CommonUIView {
    
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
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor(named: "grey100")
        
        addSubview(searchBar)
        addSubview(pinnedReicipientsUIView)
        addSubview(recentRecipientsUIView)
        addSubview(transActionsUIView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 24)),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -165)),
            
            pinnedReicipientsUIView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            pinnedReicipientsUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pinnedReicipientsUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pinnedReicipientsUIView.heightAnchor.constraint(equalToConstant: 137),

            recentRecipientsUIView.topAnchor.constraint(equalTo: pinnedReicipientsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            recentRecipientsUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentRecipientsUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recentRecipientsUIView.heightAnchor.constraint(equalToConstant: 101),
            
            transActionsUIView.topAnchor.constraint(equalTo: recentRecipientsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            transActionsUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transActionsUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            transActionsUIView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
