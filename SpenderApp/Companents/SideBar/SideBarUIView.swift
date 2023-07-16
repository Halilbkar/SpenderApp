//
//  SideBarUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit
import FirebaseAuth

protocol SideBarUIViewProtocol: AnyObject {
    func selectTitle(with sectionTitle: SideBarSection)
    func selectSection(with selectSection: SideBarSection)
    func logoutTapped()
}

class SideBarUIView: UIView {
    
    var sections = SideBarSection.allCases
    
    private lazy var sideBarTableView: UITableView = {
        
        let table = UITableView()
        table.backgroundColor = .black
        table.showsHorizontalScrollIndicator = false
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(SideBarTableViewCell.self, forCellReuseIdentifier: SideBarTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
    
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.baseForegroundColor = .black
        button.configuration?.title = "Log Out"
        button.configuration?.buttonSize = .small
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        return button
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10

        addSubview(containerView)
        addSubview(logoutButton)
        containerView.addSubview(sideBarTableView)
    }
    
    weak var delegate: SideBarUIViewProtocol?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 542)),
            
            sideBarTableView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: CGFloat.dHeight(padding: 32)),
            sideBarTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: CGFloat.dWidth(padding: 24)),
            sideBarTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: CGFloat.dWidth(padding: -24)),
            sideBarTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: CGFloat.dHeight(padding: -52)),
            
            logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -24)),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -24))
        ])
    }
    
    @objc func logoutButtonTapped() {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            self.delegate?.logoutTapped()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SideBarUIView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideBarTableViewCell.identifier, for: indexPath) as! SideBarTableViewCell
        
        let section = sections[indexPath.row]
        
        cell.config(with: section)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: indexPath) as? SideBarTableViewCell
        
        self.delegate?.selectTitle(with: sections[indexPath.row])
        
        cell?.didSelectConfig()
        
        self.delegate?.selectSection(with: sections[indexPath.row])
    }
}

