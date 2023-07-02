//
//  BankingUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

class BankingUIView: UIView {
    
    private lazy var bankingLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Banking"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var bankingbuttonLabel: UILabel = {
        let label = UILabel()
        
        label.text = "VİEW ALL"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var bankingCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 344, height: 52)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BankingCollectionViewCell.self, forCellWithReuseIdentifier: BankingCollectionViewCell.identifier)
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
        
        addSubview(bankingLabel)
        addSubview(bankingbuttonLabel)
        addSubview(bankingCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            bankingLabel.topAnchor.constraint(equalTo: topAnchor),
            bankingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            
            bankingbuttonLabel.topAnchor.constraint(equalTo: topAnchor),
            bankingbuttonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            bankingCollectionView.topAnchor.constraint(equalTo: bankingLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            bankingCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            bankingCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            bankingCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}

extension BankingUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankingCollectionViewCell.identifier, for: indexPath) as! BankingCollectionViewCell
        
        return cell
    }
    
}
