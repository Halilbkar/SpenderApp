//
//  RecentRecipientsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 1.07.2023.
//

import UIKit

class RecentRecipientsUIView: UIView {

    private lazy var recentLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Recent Recipients"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var viewallLabel: UILabel = {
        let label = UILabel()
        
        label.text = "VIEW ALL"
        label.font = .boldSystemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var transferCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 58, height: 58)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TransferCollectionViewCell.self, forCellWithReuseIdentifier: TransferCollectionViewCell.identifier)
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
        
        addSubview(recentLabel)
        addSubview(viewallLabel)
        addSubview(transferCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            recentLabel.topAnchor.constraint(equalTo: topAnchor),
            recentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            recentLabel.trailingAnchor.constraint(equalTo: viewallLabel.leadingAnchor),
            
            viewallLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 4)),
            viewallLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            
            transferCollectionView.topAnchor.constraint(equalTo: viewallLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            transferCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transferCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            transferCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}

extension RecentRecipientsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransferCollectionViewCell.identifier, for: indexPath) as! TransferCollectionViewCell
        
        return cell
    }
}
