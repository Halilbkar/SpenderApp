//
//  ActiveGoalsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 30.06.2023.
//

import UIKit

class ActiveGoalsUIView: UIView {
    
    private lazy var activeGoalsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Active Goals"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var activeButtonLabel: UILabel = {
        let label = UILabel()
        
        label.text = "+ ADD BUDGET"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var activeCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 343, height: 103)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SpendingGoalsCollectionViewCell.self, forCellWithReuseIdentifier: SpendingGoalsCollectionViewCell.identifier)
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
        
        addSubview(activeGoalsLabel)
        addSubview(activeButtonLabel)
        addSubview(activeCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            activeGoalsLabel.topAnchor.constraint(equalTo: topAnchor),
            activeGoalsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            activeGoalsLabel.trailingAnchor.constraint(equalTo: activeButtonLabel.leadingAnchor),
            
            activeButtonLabel.topAnchor.constraint(equalTo: topAnchor),
            activeButtonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            activeCollectionView.topAnchor.constraint(equalTo: activeGoalsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            activeCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            activeCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            activeCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -24))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension ActiveGoalsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpendingGoalsCollectionViewCell.identifier, for: indexPath) as! SpendingGoalsCollectionViewCell
        
        return cell
    }
}
