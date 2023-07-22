//
//  ChartsHelpers.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import Foundation
import UIKit
import DGCharts

class ChartsManager {
    
    static let shared = ChartsManager()
    
    private init() {}
    
    func configurePieChart(_ pieChartView: PieChartView, text: String) {
        pieChartView.usePercentValuesEnabled = true
        pieChartView.drawSlicesUnderHoleEnabled = false
        pieChartView.holeRadiusPercent = 0.5
        pieChartView.transparentCircleRadiusPercent = 0.6
        pieChartView.legend.enabled = false
        pieChartView.entryLabelColor = UIColor.black
        pieChartView.entryLabelFont = UIFont.systemFont(ofSize: 32)
        
        // Çizgi kalınlığını ayarla
        pieChartView.drawEntryLabelsEnabled = false
        pieChartView.drawCenterTextEnabled = true
        pieChartView.centerText = text
        pieChartView.drawHoleEnabled = true
        pieChartView.holeColor = UIColor.clear
        pieChartView.holeRadiusPercent = 0.7
        pieChartView.rotationEnabled = false
        pieChartView.rotationAngle = 0
        pieChartView.highlightPerTapEnabled = false
        pieChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutBack)
        
    }
    
    func createPieChartData(value: Double, emptyValue: Double) -> PieChartData {
        let dataEntry = PieChartDataEntry(value: value, label: "")
        let emptyEntry = PieChartDataEntry(value: emptyValue, label: "")
        
        let dataSet = PieChartDataSet(entries: [dataEntry, emptyEntry], label: "")
        dataSet.colors = [UIColor.green, UIColor.systemGray5]
        dataSet.drawValuesEnabled = false
        dataSet.selectionShift = 0
        
        return PieChartData(dataSet: dataSet)
    }
}

