//
//  SavingsGoalsCollectionViewCell.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit
import DGCharts

class SavingsGoalsCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Camera Lens"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        
        label.text = "54 %"
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var completeLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Complete"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var daysLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Home Depot"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var savedLabel: UILabel = {
        let label = UILabel()
        
        label.text = "%10 AHEAD"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        
        label.text = "$230 SAVED"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var chartsView: PieChartView = {
        let charts = PieChartView()
        
        charts.translatesAutoresizingMaskIntoConstraints = false
        
        return charts
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .white
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(percentageLabel)
        contentView.addSubview(completeLabel)
        contentView.addSubview(daysLabel)
        contentView.addSubview(savedLabel)
        contentView.addSubview(leftLabel)
        contentView.addSubview(chartsView)
        
        ChartsManager.shared.configurePieChart(chartsView, text: "")
        let data = ChartsManager.shared.createPieChartData(value: 20, emptyValue: 80)
        chartsView.data = data
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            percentageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            percentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            
            completeLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor),
            completeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            
            daysLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 16)),
            daysLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            savedLabel.bottomAnchor.constraint(equalTo: leftLabel.topAnchor, constant: CGFloat.dHeight(padding: -2)),
            savedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            leftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            
            chartsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            chartsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            chartsView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 96)),
            chartsView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 96))
            
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
