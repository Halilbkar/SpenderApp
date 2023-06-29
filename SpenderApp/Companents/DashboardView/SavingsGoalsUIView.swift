//
//  SavingGoals.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

class SavingsGoalsUIView: UIView {
    
    private lazy var savingsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Savings Goals"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var savingsbuttonLabel: UILabel = {
        let label = UILabel()
        
        label.text = "VİEW ALL"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var savingsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 267, height: 156)
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

        addSubview(savingsLabel)
        addSubview(savingsbuttonLabel)
        addSubview(savingsCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            savingsLabel.topAnchor.constraint(equalTo: topAnchor),
            savingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            savingsLabel.trailingAnchor.constraint(equalTo: savingsbuttonLabel.leadingAnchor),
            
            savingsbuttonLabel.topAnchor.constraint(equalTo: topAnchor),
            savingsbuttonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            savingsCollectionView.topAnchor.constraint(equalTo: savingsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            savingsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            savingsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            savingsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}

extension SavingsGoalsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavingsGoalsCollectionViewCell.identifier, for: indexPath) as! SavingsGoalsCollectionViewCell
        
        
        return cell
    }
}

