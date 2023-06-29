//
//  GoalsUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class GoalsUIView: UIView {

    private lazy var goalsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Goals"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var goalsButtonLabel: UILabel = {
        let label = UILabel()
        
        label.text = "+ ADD GOAL"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var goalsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 343, height: 186)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SavingsGoalsCollectionViewCell.self, forCellWithReuseIdentifier: SavingsGoalsCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(goalsLabel)
        addSubview(goalsButtonLabel)
        addSubview(goalsCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            goalsLabel.topAnchor.constraint(equalTo: topAnchor),
            goalsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            goalsLabel.trailingAnchor.constraint(equalTo: goalsButtonLabel.leadingAnchor),
            
            goalsButtonLabel.topAnchor.constraint(equalTo: topAnchor),
            goalsButtonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            goalsCollectionView.topAnchor.constraint(equalTo: goalsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            goalsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            goalsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            goalsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension GoalsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavingsGoalsCollectionViewCell.identifier, for: indexPath) as! SavingsGoalsCollectionViewCell
        
        return cell
    }
}
