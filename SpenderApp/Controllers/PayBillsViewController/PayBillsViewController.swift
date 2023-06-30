//
//  PayBillsViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class PayBillsViewController: UIViewController {
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Pay", "Activity"])
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .black
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlTapped(sender:)), for: .valueChanged)
        
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(segmentedControl)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
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
        
    }

    private func showSecondScreen() {
        
    }

}
