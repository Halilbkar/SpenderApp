//
//  CommonUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 20.07.2023.
//

import UIKit

protocol CommonUIViewDelegate: AnyObject {
    func tappedQuickAction(with toController: SideBarSection)
}

class CommonUIView: UIView {
    
    weak var superViewDelegate: CommonUIViewDelegate?

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
