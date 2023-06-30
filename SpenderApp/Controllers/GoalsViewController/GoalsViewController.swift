//
//  GoalsViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

class GoalsViewController: UIViewController {
    
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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(segmentedControl)
        view.addSubview(pinnedGoalsUIView)
        view.addSubview(goalsUIView)
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
            goalsUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 399))
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
    }

    private func showSecondScreen() {
        pinnedGoalsUIView.isHidden = true
        goalsUIView.isHidden = pinnedGoalsUIView.isHidden
    }
}
