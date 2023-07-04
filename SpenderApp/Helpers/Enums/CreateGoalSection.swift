//
//  CreateGoalSection.swift
//  SpenderApp
//
//  Created by Halil Bakar on 4.07.2023.
//

import Foundation
import UIKit

enum CreateGoalSection: Int {
    case oneSeg = 0
    case twoSeg
    case threeSeg
    
    var view: MainCreateGoal {
        switch self {
        case .oneSeg:
            return CreateGoalOne()
        case .twoSeg:
            return CreateGoalTwo()
        case .threeSeg:
            return CreateGoalThree()
        }
    }
}
 
