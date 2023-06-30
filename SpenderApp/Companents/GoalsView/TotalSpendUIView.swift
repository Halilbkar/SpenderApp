//
//  TotalSpendUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class TotalSpendUIView: UIView {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var currentDate: Date = Date() {
        didSet {
            updateDateLabel()
        }
    }
    
    private lazy var totalSpendUIView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var spendLabel: UILabel = {
        let label = UILabel()
        
        label.text = "-$100,000.00"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        
        label.text = "total spend this month"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        
        label.translatesAutoresizingMaskIntoConstraints = false

        
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear

        addSubview(dateLabel)
        addSubview(totalSpendUIView)
        
        totalSpendUIView.addSubview(spendLabel)
        totalSpendUIView.addSubview(descLabel)
        
        updateDateLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            totalSpendUIView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            totalSpendUIView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: CGFloat.dWidth(padding: 60.5)),
            totalSpendUIView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 254)),
            totalSpendUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 111)),
            
            spendLabel.topAnchor.constraint(equalTo: totalSpendUIView.topAnchor, constant: CGFloat.dHeight(padding: 24)),
            spendLabel.leadingAnchor.constraint(equalTo: totalSpendUIView.leadingAnchor, constant: CGFloat.dWidth(padding: 24)),
            spendLabel.trailingAnchor.constraint(equalTo: totalSpendUIView.trailingAnchor, constant: CGFloat.dWidth(padding: -24)),
            
            descLabel.topAnchor.constraint(equalTo: spendLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            descLabel.leadingAnchor.constraint(equalTo: totalSpendUIView.leadingAnchor, constant: CGFloat.dWidth(padding: 59.5)),
            descLabel.trailingAnchor.constraint(equalTo: totalSpendUIView.trailingAnchor, constant: CGFloat.dWidth(padding: -59.5))
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
