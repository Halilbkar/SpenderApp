//
//  PayBillsViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class MainPayBillsUIView: CommonUIView {
    
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
    
    private lazy var payUIView: PayUView = {
        let view = PayUView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor(named: "grey100")
        
        addSubview(segmentedControl)
        addSubview(payUIView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 24)),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            payUIView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: CGFloat.dHeight(padding: 30)),
            payUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            payUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            payUIView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
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
