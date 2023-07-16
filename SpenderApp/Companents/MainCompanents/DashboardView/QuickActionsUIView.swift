//
//  QuickActionsUIView.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 27.06.2023.
//

import UIKit

protocol QuickActionsUIViewProtocol: AnyObject {
    func tapped(toVC: SideBarSection)
}

class QuickActionsUIView: UIView {
    
    private lazy var quickActionsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Quick Actions"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var quickActionsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 134, height: 25)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(QuickActionsCollectionViewCell.self, forCellWithReuseIdentifier: QuickActionsCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    weak var delegate: QuickActionsUIViewProtocol?

    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(quickActionsLabel)
        addSubview(quickActionsCollectionView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            quickActionsLabel.topAnchor.constraint(equalTo: topAnchor),
            quickActionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            quickActionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            quickActionsCollectionView.topAnchor.constraint(equalTo: quickActionsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 8)),
            quickActionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            quickActionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            quickActionsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension QuickActionsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuickActionsCollectionViewCell.identifier, for: indexPath) as! QuickActionsCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.tapped(toVC: .goals)
    }
}
