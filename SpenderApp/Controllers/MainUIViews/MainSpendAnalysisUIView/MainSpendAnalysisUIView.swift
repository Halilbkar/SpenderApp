//
//  SpendAnalysisViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class MainSpendAnalysisUIView: CommonUIView {
    
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
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor(named: "grey100")
        
        addSubview(dateUIView)
        addSubview(donutChartsUIView)
        addSubview(categoryListUIView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            dateUIView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 24)),
            dateUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 48)),
            
            donutChartsUIView.topAnchor.constraint(equalTo: dateUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            donutChartsUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            donutChartsUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            donutChartsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 343)),
            
            categoryListUIView.topAnchor.constraint(equalTo: donutChartsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            categoryListUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryListUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryListUIView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
