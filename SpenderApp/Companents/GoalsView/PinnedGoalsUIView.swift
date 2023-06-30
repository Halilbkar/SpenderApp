//
//  PinnedGoalsUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class PinnedGoalsUIView: UIView {
    
    private lazy var pinnedGoalsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Pinned Goals"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var pinnedGoalsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 250, height: 163)
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
        
        addSubview(pinnedGoalsLabel)
        addSubview(pinnedGoalsCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            pinnedGoalsLabel.topAnchor.constraint(equalTo: topAnchor),
            pinnedGoalsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            pinnedGoalsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            pinnedGoalsCollectionView.topAnchor.constraint(equalTo: pinnedGoalsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            pinnedGoalsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            pinnedGoalsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            pinnedGoalsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension PinnedGoalsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavingsGoalsCollectionViewCell.identifier, for: indexPath) as! SavingsGoalsCollectionViewCell
        
        return cell
    }
}
