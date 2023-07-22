//
//  DashboradViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

class MainDashboradUIView: CommonUIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        
        return scrollView
    }()
    
    private lazy var quickActionsUIView: QuickActionsUIView = {
        let view = QuickActionsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        
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
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor(named: "grey100")
        
        addSubview(scrollView)

        scrollView.addSubview(quickActionsUIView)
        scrollView.addSubview(bankingUIView)
        scrollView.addSubview(creditUIView)
        scrollView.addSubview(savingsGoalsUIView)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        scrollView.contentSize = CGSize(width: frame.size.width, height: 750)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            quickActionsUIView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            quickActionsUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            quickActionsUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            quickActionsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 58)),
            
            bankingUIView.topAnchor.constraint(equalTo: quickActionsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            bankingUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bankingUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bankingUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 163)),

            creditUIView.topAnchor.constraint(equalTo: bankingUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            creditUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            creditUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            creditUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 202)),

            savingsGoalsUIView.topAnchor.constraint(equalTo: creditUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            savingsGoalsUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            savingsGoalsUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            savingsGoalsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 219))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension MainDashboradUIView: QuickActionsUIViewProtocol {
    func tapped(with toController: SideBarSection) {
            let superView = superview as! CommonUIView
            superView.removeSubview()
            superView.addSubview(toController.view)
        
        superViewDelegate?.tappedQuickAction(with: toController)
    }
}
