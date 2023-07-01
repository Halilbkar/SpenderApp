//
//  DateUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class DateUIView: UIView {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var currentDate: Date = Date() {
        didSet {
            updateDateLabel()
        }
    }
    
    private lazy var dateButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.image = UIImage(systemName: "calendar")
        button.configuration?.baseForegroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var sortButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.image = UIImage(systemName: "cursorarrow.motionlines")
        button.configuration?.baseForegroundColor = .black
        button.configuration?.buttonSize = .large

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Up 7% from last month"
        label.textColor = .red
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(dateLabel)
        addSubview(dateButton)
        addSubview(sortButton)
        addSubview(descLabel)
        
        updateDateLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            dateButton.topAnchor.constraint(equalTo: topAnchor),
            dateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            dateButton.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 48)),
            dateButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 48)),
            
            sortButton.topAnchor.constraint(equalTo: topAnchor),
            sortButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            sortButton.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 48)),
            sortButton.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 48)),

            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: dateButton.trailingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor),
            
            descLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            descLabel.leadingAnchor.constraint(equalTo: dateButton.trailingAnchor),
            descLabel.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor)
        ])
        
    }
    
    private func updateDateLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        dateLabel.text = dateString
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
