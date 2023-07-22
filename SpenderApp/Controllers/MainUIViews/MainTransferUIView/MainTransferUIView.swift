//
//  TransferViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 29.06.2023.
//

import UIKit

class MainTransferUIView: CommonUIView {
    
    private lazy var verticalTransfersUIView: VerticalAccountTransfersUIView = {
        let view = VerticalAccountTransfersUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var horizontalTransfersUIView: HorizontalAccountTransfersUIView = {
        let view = HorizontalAccountTransfersUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var recentReicipientsTransferUIView: RecentReicipientsTransferUIView = {
        let view = RecentReicipientsTransferUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor(named: "grey100")
        
        addSubview(verticalTransfersUIView)
        addSubview(horizontalTransfersUIView)
        addSubview(recentReicipientsTransferUIView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
        
            verticalTransfersUIView.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.dHeight(padding: 24)),
            verticalTransfersUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalTransfersUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalTransfersUIView.heightAnchor.constraint(equalToConstant: 137),
            
            horizontalTransfersUIView.topAnchor.constraint(equalTo: verticalTransfersUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            horizontalTransfersUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalTransfersUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalTransfersUIView.heightAnchor.constraint(equalToConstant: 85),
            
            recentReicipientsTransferUIView.topAnchor.constraint(equalTo: horizontalTransfersUIView.bottomAnchor, constant: CGFloat.dHeight(padding: 48)),
            recentReicipientsTransferUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recentReicipientsTransferUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recentReicipientsTransferUIView.heightAnchor.constraint(equalToConstant: 102)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
