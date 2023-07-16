//
//  SpendAnalysisViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class SpendAnalysisViewController: SubViewController {
    
    private lazy var dateUIView: DateUIView = {
        let view = DateUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var donutChartsUIView: DonutChartsUIView = {
        let view = DonutChartsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var categoryListUIView: CategoryListUIView = {
        let view = CategoryListUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(dateUIView)
        view.addSubview(donutChartsUIView)
        view.addSubview(categoryListUIView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
        
            dateUIView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            dateUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 48)),
            
            donutChartsUIView.topAnchor.constraint(equalTo: dateUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            donutChartsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            donutChartsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            donutChartsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 343)),
            
            categoryListUIView.topAnchor.constraint(equalTo: donutChartsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            categoryListUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryListUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryListUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
