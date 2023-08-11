//
//  MainViewController.swift
//  MoneyManagerApp
//
//  Created by Halil Bakar on 26.06.2023.
//

import UIKit
import SDWebImage
import FirebaseAuth
import FirebaseDatabase

class MainViewController: UIViewController {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 32, height: 32))

        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView

    }()

    private lazy var headerLabel: UILabel = {
        let label = UILabel()

        label.text = "Welcome back, Halil"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var headerButton: UIButton = {
        var config = UIButton.Configuration.filled()
  
        config.cornerStyle = .capsule
        config.buttonSize = .medium
        config.image = UIImage(systemName: "list.bullet.circle")
        config.baseBackgroundColor = .gray
        config.baseForegroundColor = .white
        
        let button = UIButton(configuration: config)

        button.isSelected = true
        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(headerButtonTapped), for: .touchUpInside)

        return button
    }()
    
    private lazy var sideBarUIView: SideBarUIView = {
        let view = SideBarUIView()
        
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = viewModel.dataSource
        
        return view
    }()
    
    private lazy var containerView: CommonUIView = {
        let view = CommonUIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "grey100")
        view.superViewDelegate = viewModel.dataSource
        
        return view
    }()
    
    private lazy var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "grey100")
        navigationController?.setNavigationBarHidden(true, animated: false)

        view.addSubview(headerView)
        view.addSubview(containerView)
        view.addSubview(sideBarUIView)
        
        headerView.addSubview(imageView)
        headerView.addSubview(headerLabel)
        headerView.addSubview(headerButton)
        
        viewModel.dataSource.delegate = self
        viewModel.delegate = self
        
        viewModel.getUserData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        containerView.addSubview(SideBarSection.dashboard.view)
        
//        viewModel.fetchUserData(nameLabel: headerLabel, imageView: imageView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 375)),
            headerView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 112)),
            
            imageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: CGFloat.dWidth(padding: 16)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 32)),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat.dWidth(padding: 32)),

            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CGFloat.dHeight(padding: -20)),
            headerLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat.dWidth(padding: 12)),

            headerButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: CGFloat.dHeight(padding: -16)),
            headerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: CGFloat.dWidth(padding: -20)),
            
            sideBarUIView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            sideBarUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sideBarUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sideBarUIView.heightAnchor.constraint(equalToConstant: CGFloat.dHeight(padding: 542)),
            
            containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func sideBarConfig() {
        headerButton.isSelected = !headerButton.isSelected
        sideBarUIView.isHidden = headerButton.isSelected
        headerView.layer.cornerRadius = sideBarUIView.isHidden ? 32 : 0
        headerButton.configuration?.image = sideBarUIView.isHidden ? UIImage(systemName: "list.bullet.circle") : UIImage(systemName: "x.circle")
    }
    
    @objc private func headerButtonTapped() {
        sideBarConfig()
    }
}

extension MainViewController: MainDataSourceDelegate {
    func pushNavigation() {
        let view = LoginViewController()
        navigationController?.pushViewController(view, animated: true)
    }
    
    func configure(sectionTitle: SideBarSection) {
        headerLabel.text = sectionTitle.title
        sideBarConfig()
    }
    
    func viewAddSubview(selectSection: SideBarSection) {
        containerView.removeSubview()
        containerView.addSubview(selectSection.view)
    }
}

extension MainViewController: MainViewModelDelegate {
    func fetchUser(name: String, profileImageURL: String) {
        self.headerLabel.text = "Welcome back, \(name)!"
        self.imageView.sd_setImage(with: URL(string: profileImageURL))
    }
}
