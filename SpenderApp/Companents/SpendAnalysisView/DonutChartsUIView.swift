//
//  DonutChartsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit
import DGCharts

class DonutChartsUIView: UIView {
    
    private lazy var chartsView: PieChartView = {
        let charts = PieChartView()
        
        charts.translatesAutoresizingMaskIntoConstraints = false
        
        return charts
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(chartsView)
        
        ChartsManager.shared.configurePieChart(chartsView, text: "%982.38")
        let data = ChartsManager.shared.createPieChartData(value: 20, emptyValue: 80)
        chartsView.data = data
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            chartsView.topAnchor.constraint(equalTo: topAnchor),
            chartsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            chartsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            chartsView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 343))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
