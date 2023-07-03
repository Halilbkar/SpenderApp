//
//  GoalsDetailsViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit

class GoalsDetailsViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        
        return scrollView
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
    
    private lazy var goalsDetailChartsUIView: GoalsDetailChartsUIView = {
        let view = GoalsDetailChartsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var goalsDetailUIView: GoalsDetailUIView = {
        let view = GoalsDetailUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var goalsMoneyBreakdownUIView: GoalsMoneyBreakdownUIView = {
        let view = GoalsMoneyBreakdownUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var goalsAutoDepositUIView: GoalsAutoDepositUIView = {
        let view = GoalsAutoDepositUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "grey100")
        
        navigationItem.title = "Goal"
        
        view.addSubview(scrollView)
        view.addSubview(depositButton)
        
        scrollView.addSubview(goalsDetailChartsUIView)
        scrollView.addSubview(goalsDetailUIView)
        scrollView.addSubview(goalsMoneyBreakdownUIView)
        scrollView.addSubview(goalsAutoDepositUIView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1200)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            depositButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat.dHeight(padding: -24)),
            depositButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 83)),
            depositButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -83)),
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            goalsDetailChartsUIView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat.dHeight(padding: 16)),
            goalsDetailChartsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            goalsDetailChartsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            goalsDetailChartsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 320)),
            
            goalsDetailUIView.topAnchor.constraint(equalTo: goalsDetailChartsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            goalsDetailUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            goalsDetailUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            goalsDetailUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 320)),
            
            goalsMoneyBreakdownUIView.topAnchor.constraint(equalTo: goalsDetailUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            goalsMoneyBreakdownUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            goalsMoneyBreakdownUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            goalsMoneyBreakdownUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 300)),
            
            goalsAutoDepositUIView.topAnchor.constraint(equalTo: goalsMoneyBreakdownUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            goalsAutoDepositUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            goalsAutoDepositUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            goalsAutoDepositUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 120)),
        ])
    }
}
