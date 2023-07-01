//
//  PinnedReicipientsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 1.07.2023.
//

import UIKit

class PinnedReicipientsUIView: UIView {
    
    private lazy var recipientsPinnedLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Pinned"
        label.font = .boldSystemFont(ofSize: CGFloat.dWidth(padding: 20))
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var recipientsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 104, height: 104)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PinnedRecipientsCollectionViewCell.self, forCellWithReuseIdentifier: PinnedRecipientsCollectionViewCell.identifier)
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
        
        addSubview(recipientsPinnedLabel)
        addSubview(recipientsCollectionView)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            recipientsPinnedLabel.topAnchor.constraint(equalTo: topAnchor),
            recipientsPinnedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            recipientsPinnedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            recipientsCollectionView.topAnchor.constraint(equalTo: recipientsPinnedLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            recipientsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            recipientsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            recipientsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension PinnedReicipientsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinnedRecipientsCollectionViewCell.identifier, for: indexPath) as! PinnedRecipientsCollectionViewCell
        
        return cell
    }
}
