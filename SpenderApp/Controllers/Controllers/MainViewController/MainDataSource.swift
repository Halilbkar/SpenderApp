//
//  MainDataSource.swift
//  SpenderApp
//
//  Created by Halil Bakar on 23.07.2023.
//

import Foundation
import UIKit

protocol MainDataSourceDelegate: AnyObject {
    func configure(sectionTitle: SideBarSection)
    func viewAddSubview(selectSection: SideBarSection)
    func pushNavigation()
}

class MainDataSource {
    
    weak var delegate: MainDataSourceDelegate?
}

extension MainDataSource: SideBarUIViewProtocol {
    func selectTitle(with sectionTitle: SideBarSection) {
        self.delegate?.configure(sectionTitle: sectionTitle)
        
    }
    
    func selectSection(with selectSection: SideBarSection) {
        self.delegate?.viewAddSubview(selectSection: selectSection)
       
    }
    
    func logoutTapped() {
        self.delegate?.pushNavigation()
    }
}

extension MainDataSource: CommonUIViewDelegate {
    func tappedQuickAction(with toController: SideBarSection) {
        self.delegate?.viewAddSubview(selectSection: toController)
    }
}
