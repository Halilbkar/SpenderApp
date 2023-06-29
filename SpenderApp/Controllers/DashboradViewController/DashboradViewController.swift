//
//  DashboradViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

class DashboradViewController: UIViewController {
    
    private lazy var quickActionsUIView: QuickActionsUIView = {
        let view = QuickActionsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var bankingUIView: BankingUIView = {
        let view = BankingUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var creditUIView: CreditUIView = {
        let view = CreditUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var savingsGoalsUIView: SavingsGoalsUIView = {
        let view = SavingsGoalsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(quickActionsUIView)
        view.addSubview(bankingUIView)
        view.addSubview(creditUIView)
        view.addSubview(savingsGoalsUIView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            quickActionsUIView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            quickActionsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quickActionsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quickActionsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 58)),
            
            bankingUIView.topAnchor.constraint(equalTo: quickActionsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            bankingUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bankingUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bankingUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 163)),

            creditUIView.topAnchor.constraint(equalTo: bankingUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            creditUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            creditUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            creditUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 202)),

            savingsGoalsUIView.topAnchor.constraint(equalTo: creditUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            savingsGoalsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            savingsGoalsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            savingsGoalsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 219))
        ])
    }

}
