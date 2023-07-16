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
    
    var vc: SubViewController {
        switch self {
        case .dashboard:
            return DashboradViewController()
        case .goals:
            return GoalsViewController()
        case .spendAnalysis:
            return SpendAnalysisViewController()
        case .transfer:
            return TransferViewController()
        case .payBills:
            return PayBillsViewController()
        case .depositCheck:
            return DepositCheckViewController()
        case .recipients:
            return RecipientsViewController()
        case .profile:
            return ProfileViewController()
        case .support:
            return SupportViewController()
        case .settings:
            return SettingsViewController()
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
