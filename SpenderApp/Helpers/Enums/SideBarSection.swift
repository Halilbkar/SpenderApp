//
//  SideBarEnum.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import Foundation
import UIKit

enum SideBarSection: Int, CaseIterable {
    case dashboard = 0
    case goals
    case spendAnalysis
    case transfer
    case payBills
    case depositCheck
    case recipients
    case profile
    case support
    case settings
    
    var view: CommonUIView {
        switch self {
        case .dashboard:
            return MainDashboradUIView()
        case .goals:
            return MainGoalsUIView()
        case .spendAnalysis:
            return MainSpendAnalysisUIView()
        case .transfer:
            return MainTransferUIView()
        case .payBills:
            return MainPayBillsUIView()
        case .depositCheck:
            return MainDepositCheckUIView()
        case .recipients:
            return MainRecipientsUIView()
        case .profile:
            return MainProfileUIView()
        case .support:
            return MainSupportUIView()
        case .settings:
            return MainSettingsUIView()
        }
    }
    
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .goals:
            return "Goals"
        case .spendAnalysis:
            return "Spend Analysis"
        case .transfer:
            return "Transfer"
        case .payBills:
            return "Pay Bills"
        case .depositCheck:
            return "DepositCheck"
        case .recipients:
            return "Recipients"
        case .profile:
            return "Profile"
        case .support:
            return "Support"
        case .settings:
            return "Settings"
        }
    }
}
