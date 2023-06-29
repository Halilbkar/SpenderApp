//
//  SideBarEnum.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import Foundation
import UIKit

enum SideBarSection: String, CaseIterable {
    case dashboard = "Dashboard"
    case goals = "Goals"
    case spendAnalysis = "Spend Analysis"
    case transfer = "Transfer"
    case payBills = "Pay Bills"
    case depositCheck = "DepositCheck"
    case recipients = "Recipients"
    case profile = "Profile"
    case support = "Support"
    case settings = "Settings"
    
    var view: UIViewController {
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
}
