//
//  EditGoalViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 4.07.2023.
//

import UIKit

class EditGoalViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        
        return scrollView
    }()
    
    private lazy var goalsDetailsUIView: EditSavingsGoalsDetailsUIView = {
        let view = EditSavingsGoalsDetailsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var selectAccountUIView: EditSavingsSelectAccountUIView = {
        let view = EditSavingsSelectAccountUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var moneyBreakDownUIView: EditSavingMoneyBreakDownUIView = {
        let view = EditSavingMoneyBreakDownUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var chartsUIView: EditChartsUIView = {
        let view = EditChartsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private lazy var transferUIView: EditTransferUIView = {
        let view = EditTransferUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "grey100")
        navigationItem.title = "Goal"

        view.addSubview(scrollView)

        scrollView.addSubview(goalsDetailsUIView)
        scrollView.addSubview(selectAccountUIView)
        scrollView.addSubview(moneyBreakDownUIView)
        scrollView.addSubview(chartsUIView)
        scrollView.addSubview(transferUIView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1250)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
            goalsDetailsUIView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            goalsDetailsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            goalsDetailsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            goalsDetailsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 280)),
            
            selectAccountUIView.topAnchor.constraint(equalTo: goalsDetailsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            selectAccountUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectAccountUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectAccountUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 90)),
            
            moneyBreakDownUIView.topAnchor.constraint(equalTo: selectAccountUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            moneyBreakDownUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moneyBreakDownUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moneyBreakDownUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 160)),
            
            chartsUIView.topAnchor.constraint(equalTo: moneyBreakDownUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            chartsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            chartsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            chartsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 340)),
            
            transferUIView.topAnchor.constraint(equalTo: chartsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 16)),
            transferUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transferUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            transferUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 220)),
        ])
    }

}
