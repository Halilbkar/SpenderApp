//
//  CreateGoalThree.swift
//  SpenderApp
//
//  Created by Halil Bakar on 3.07.2023.
//

import UIKit

class CreateGoalThree: MainCreateGoal {
   
    private lazy var createGoalOne: CreateGoalOne = {
        let view = CreateGoalOne()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var createGoalTwo: CreateGoalTwo = {
        let view = CreateGoalTwo()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        layer.cornerRadius = 15
        backgroundColor = .clear
        
        addSubview(createGoalOne)
        addSubview(createGoalTwo)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                
        NSLayoutConstraint.activate([
    
            createGoalOne.topAnchor.constraint(equalTo: topAnchor),
            createGoalOne.leadingAnchor.constraint(equalTo: leadingAnchor),
            createGoalOne.trailingAnchor.constraint(equalTo: trailingAnchor),
            createGoalOne.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 400)),
            
            createGoalTwo.topAnchor.constraint(equalTo: createGoalOne.bottomAnchor,constant: CGFloat.dHeight(padding: 12)),
            createGoalTwo.leadingAnchor.constraint(equalTo: leadingAnchor),
            createGoalTwo.trailingAnchor.constraint(equalTo: trailingAnchor),
            createGoalTwo.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 300))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
