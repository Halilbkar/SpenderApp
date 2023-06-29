//
//  Extension+Cells.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}
