//
//  TransActionsUIView.swift
//  SpenderApp
//
//  Created by Halil Bakar on 1.07.2023.
//

import UIKit

class TransActionsUIView: UIView {

    private lazy var transActionsLabel: UILabel = {
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
    
    private lazy var transActionsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 343, height: 74)
        layout.minimumInteritemSpacing = 8
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TransActionsCollectionViewCell.self, forCellWithReuseIdentifier: TransActionsCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Pay"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var recurringButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Request"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var splitButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Split"
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        
        button.configuration?.background.strokeWidth = 1
        button.configuration?.background.strokeColor = .black

        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()


    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .clear
        
        addSubview(transActionsLabel)
        addSubview(viewallLabel)
        addSubview(transActionsCollectionView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(payButton)
        stackView.addArrangedSubview(recurringButton)
        stackView.addArrangedSubview(splitButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            transActionsLabel.topAnchor.constraint(equalTo: topAnchor),
            transActionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            transActionsLabel.trailingAnchor.constraint(equalTo: viewallLabel.leadingAnchor),

            viewallLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 4)),
            viewallLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),

            transActionsCollectionView.topAnchor.constraint(equalTo: transActionsLabel.bottomAnchor, constant: CGFloat.dHeight(padding: 12)),
            transActionsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            transActionsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            transActionsCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -83)),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat.dWidth(padding: -16)),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat.dHeight(padding: -24))
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}

extension TransActionsUIView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransActionsCollectionViewCell.identifier, for: indexPath) as! TransActionsCollectionViewCell
        
        return cell
    }
}
