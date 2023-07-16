//
//  PushManager.swift
//  SpenderApp
//
//  Created by Halil Bakar on 16.07.2023.
//

import UIKit

class PushManager {

    static let shared = PushManager()
    
    private init() { }
    
    var toVC: UIViewController?
}
