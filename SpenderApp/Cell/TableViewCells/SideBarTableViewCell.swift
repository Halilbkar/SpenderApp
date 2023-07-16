//
//  SideBarTableViewCell.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

class SideBarTableViewCell: UITableViewCell {
    
    let sectionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Sections"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 15))
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let sectionIcon: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(systemName: "circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        
        contentView.addSubview(sectionLabel)
        contentView.addSubview(sectionIcon)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            sectionIcon.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 4)),
            sectionIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionIcon.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 10)),
            sectionIcon.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 10)),
            
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionLabel.trailingAnchor.constraint(equalTo: sectionIcon.leadingAnchor, constant: CGFloat.dWidth(padding: -16))
        ])
    }
    
    func config(with section: SideBarSection) {
        sectionLabel.text = section.title
    }
    
    func didSelectConfig() {
        sectionLabel.textColor = .green
        sectionIcon.tintColor = .green
    }
    
    func deSelectConfig() {
        sectionLabel.textColor = .white
        sectionIcon.tintColor = .clear
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
