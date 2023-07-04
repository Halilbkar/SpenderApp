//
//  MainCreateGoal.swift
//  SpenderApp
//
//  Created by Halil Bakar on 4.07.2023.
//

import UIKit

class MainCreateGoal: UIView {
    
    var step = 0

    override init(frame: CGRect) {
        super .init(frame: frame)
        
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        
        subview.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func removeSubview() {
        _ = subviews.map { view in
            view.removeFromSuperview()
        }
    }

}
