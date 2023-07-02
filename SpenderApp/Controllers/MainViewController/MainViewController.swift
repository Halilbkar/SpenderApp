//
//  MainViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 32
        
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Welcome back, Halil"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var headerButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.buttonSize = .medium
        button.configuration?.image = UIImage(systemName: "list.bullet.circle")
        button.configuration?.baseBackgroundColor = .gray
        button.configuration?.baseForegroundColor = .white
        
        button.isSelected = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sideBarUIView: SideBarUIView = {
        let view = SideBarUIView()
        
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "grey100")

        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "grey100")
        
        view.addSubview(headerView)
        view.addSubview(containerView)
        view.addSubview(sideBarUIView)
        
        headerView.addSubview(headerLabel)
        headerView.addSubview(headerButton)
        
        self.displayViewController(SideBarSection.dashboard.view, containerView: containerView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 375)),
            headerView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 112)),
            
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: CGFloat.dWidth(padding: 24)),
            headerLabel.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 283)),
            
            headerButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CGFloat.dHeight(padding: -12)),
            headerButton.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor),
            
            sideBarUIView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            sideBarUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sideBarUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sideBarUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 542)),
            
            containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func sideBarConfig() {
        headerButton.isSelected = !headerButton.isSelected
        sideBarUIView.isHidden = headerButton.isSelected
        headerView.layer.cornerRadius = sideBarUIView.isHidden ? 32 : 0
        headerButton.configuration?.image = sideBarUIView.isHidden ? UIImage(systemName: "list.bullet.circle") : UIImage(systemName: "x.circle")
    }
    
    @objc private func headerButtonTapped() {
        sideBarConfig()
    }
}

extension MainViewController: SideBarUIViewProtocol {
    func selectTitle(with sectionTitle: String) {
        headerLabel.text = sectionTitle
        sideBarConfig()
    }
    
    func selectSection(with selectSection: String) {
        guard let selectView = SideBarSection(rawValue: selectSection)?.view else { return }
        
        self.displayViewController(selectView, containerView: containerView)
    }
}
