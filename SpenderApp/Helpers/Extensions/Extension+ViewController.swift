//
//  Extension+ViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    private struct AssociatedKeys {
        static var currentViewController = "currentViewController"
    }
    
    private var currentViewController: UIViewController? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.currentViewController) as? UIViewController
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.currentViewController, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func displayViewController(_ viewController: UIViewController, containerView: UIView) {
        // Remove the previous view controller
        removeCurrentViewController()
        
        // Add the new view controller
        addChild(viewController)
        viewController.view.frame = containerView.bounds
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        
        // Save the current view controller
        currentViewController = viewController
    }
    
    private func removeCurrentViewController() {
        currentViewController?.willMove(toParent: nil)
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        currentViewController = nil
    }
}
