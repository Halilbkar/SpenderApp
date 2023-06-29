//
//  CreditUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

class CreditUIView: UIView {
    
    private lazy var creditLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Credit"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var creditbuttonLabel: UILabel = {
        let label = UILabel()
        
        label.text = "VİEW ALL"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var creditCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 150, height: 159)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CreditUICollectionViewCell.self, forCellWithReuseIdentifier: CreditUICollectionViewCell.identifier)
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

        addSubview(creditLabel)
        addSubview(creditbuttonLabel)
        addSubview(creditCollectionView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            creditLabel.topAnchor.constraint(equalTo: topAnchor),
            creditLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            creditLabel.trailingAnchor.constraint(equalTo: creditbuttonLabel.leadingAnchor),
            
            creditbuttonLabel.topAnchor.constraint(equalTo: topAnchor),
            creditbuttonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            creditCollectionView.topAnchor.constraint(equalTo: creditLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            creditCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            creditCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            creditCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}

extension CreditUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditUICollectionViewCell.identifier, for: indexPath) as! CreditUICollectionViewCell
        
        
        return cell
    }
    
    
}
