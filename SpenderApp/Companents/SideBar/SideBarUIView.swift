//
//  SideBarUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

protocol SideBarUIViewProtocol: AnyObject {
    func selectTitle(with sectionTitle: String)
    func selectSection(with selectSection: String)
}

class SideBarUIView: UIView {
    
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

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 10

        addSubview(containerView)
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
            sideBarTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: CGFloat.dHeight(padding: -52))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension SideBarUIView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideBarSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideBarTableViewCell.identifier, for: indexPath) as! SideBarTableViewCell
        
        let sections = SideBarSection.allCases[indexPath.row]
        
        cell.config(with: sections.rawValue)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cell = tableView.cellForRow(at: indexPath) as? SideBarTableViewCell
        
        self.delegate?.selectTitle(with: (cell?.sectionLabel.text)!)
        
        cell?.didSelectConfig()
        
        self.delegate?.selectSection(with: (cell?.sectionLabel.text)!)
    }
}

