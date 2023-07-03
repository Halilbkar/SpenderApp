//
//  GoalsDetailChartsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 2.07.2023.
//

import UIKit
import DGCharts

class GoalsDetailChartsUIView: UIView {
    
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
        
        addSubview(percentageLabel)
        addSubview(completeLabel)
        addSubview(savedLabel)
        addSubview(leftLabel)
        addSubview(chartsView)
        
        ChartsManager.shared.configurePieChart(chartsView, text: "")
        let data = ChartsManager.shared.createPieChartData(value: 20, emptyValue: 80)
        chartsView.data = data
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            chartsView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 24)),
            chartsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            chartsView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 200)),
            chartsView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 200)),
            
            percentageLabel.topAnchor.constraint(equalTo: chartsView.bottomAnchor, constant: CGFloat.dHeight(padding: 24)),
            percentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 60)),
            percentageLabel.bottomAnchor.constraint(equalTo: completeLabel.topAnchor),
            
            completeLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor),
            completeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 60)),
            completeLabel.trailingAnchor.constraint(equalTo: savedLabel.leadingAnchor, constant: CGFloat.dWidth(padding: -24)),
            
            savedLabel.topAnchor.constraint(equalTo: chartsView.bottomAnchor, constant: CGFloat.dHeight(padding: 30)),
            savedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -60)),
            
            leftLabel.topAnchor.constraint(equalTo: savedLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            leftLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dHeight(padding: -60)),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
