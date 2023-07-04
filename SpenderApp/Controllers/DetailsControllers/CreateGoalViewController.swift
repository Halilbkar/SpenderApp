//
//  CreateGoalViewController.swift
//  SpenderApp
//
//  Created by Halil Bakar on 4.07.2023.
//

import UIKit

class CreateGoalViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "twoSeg")
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.baseForegroundColor = .white
        button.configuration?.title = "Next"
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mainCreateUIView: MainCreateGoal = {
        let view = MainCreateGoal()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "grey100")
        navigationItem.title = "Goal"

        view.addSubview(imageView)
        view.addSubview(mainCreateUIView)
        view.addSubview(nextButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        configureView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat.dWidth(padding: 60)),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainCreateUIView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat.dHeight(padding: 4)),
            mainCreateUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCreateUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCreateUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 400)),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: CGFloat.dHeight(padding: -24)),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.dWidth(padding: 120)),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -120))
        ])
    }
    
    private func configureView() {
        guard let currentCase = CreateGoalSection(rawValue: mainCreateUIView.step) else { return }

        let view = currentCase.view
        
        mainCreateUIView.removeSubview()
        mainCreateUIView.addSubview(view)
    }
    
    @objc private func nextButtonTapped() {
        mainCreateUIView.step += 1
        configureView()
    }
}
