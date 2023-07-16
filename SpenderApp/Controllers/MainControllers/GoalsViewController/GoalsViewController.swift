//
//  GoalsViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

class GoalsViewController: SubViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Savings Goals", "Spending Goals"])
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .black
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped(sender:)), for: .valueChanged)
        
        return segmentedControl
    }()
    
    private lazy var pinnedGoalsUIView: PinnedGoalsUIView = {
        let view = PinnedGoalsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var goalsUIView: GoalsUIView = {
        let view = GoalsUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var activeGoalsUIView: ActiveGoalsUIView = {
        let view = ActiveGoalsUIView()
        
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var totalSpendUIView: TotalSpendUIView = {
        let view = TotalSpendUIView()
        
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(segmentedControl)
        view.addSubview(pinnedGoalsUIView)
        view.addSubview(goalsUIView)
        view.addSubview(totalSpendUIView)
        view.addSubview(activeGoalsUIView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            pinnedGoalsUIView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            pinnedGoalsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pinnedGoalsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pinnedGoalsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 196)),
            
            goalsUIView.topAnchor.constraint(equalTo: pinnedGoalsUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 32)),
            goalsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            goalsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            goalsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 399)),
            
            totalSpendUIView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            totalSpendUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            totalSpendUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            totalSpendUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 183)),
            
            activeGoalsUIView.topAnchor.constraint(equalTo: totalSpendUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            activeGoalsUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activeGoalsUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activeGoalsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 384))
        ])
    }

    @objc private func segmentedControlTapped(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            showFirstScreen()
        case 1:
            showSecondScreen()
        default:
            break
        }
    }
    
    private func showFirstScreen() {
        pinnedGoalsUIView.isHidden = false
        goalsUIView.isHidden = pinnedGoalsUIView.isHidden
        
        totalSpendUIView.isHidden = true
        activeGoalsUIView.isHidden = totalSpendUIView.isHidden
    }

    private func showSecondScreen() {
        pinnedGoalsUIView.isHidden = true
        goalsUIView.isHidden = pinnedGoalsUIView.isHidden
        
        totalSpendUIView.isHidden = false
        activeGoalsUIView.isHidden = totalSpendUIView.isHidden
    }
}
