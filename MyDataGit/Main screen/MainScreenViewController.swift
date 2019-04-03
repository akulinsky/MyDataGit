//  
//  MainScreenViewController.swift
//  MyDataGit
//
//  Created by Andrey Kulinskiy on 3/28/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - property
    private var presenter: MainScreenPresenterProtocol?
    
    lazy var lblName: UILabel = {
        let view = UILabel()
        view.backgroundColor = UIColor.clear
        view.textColor = UIColor.redColor
        view.font = UIFont.boldSystemFont(ofSize: 22)
        view.textAlignment = .center
        view.text = "Main Screen Test 99"
        return view
    }()
    
    lazy var btnNext: UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(clickBtnNext(_:)), for: UIControl.Event.touchUpInside)
        view.setTitle(NSLocalizedString("Next", comment: ""), for: UIControl.State.normal)
        return view
    }()
    
    // MARK: - Init
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main Screen 99"
        self.view.backgroundColor = UIColor.white
        
        self.presenter?.didLoad()
        
        self.view.addSubview(self.lblName)
        self.lblName.sizeToFit()
        self.lblName.markRandom()
        self.lblName.translatesAutoresizingMaskIntoConstraints = false
        self.lblName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.lblName.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.lblName.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.addSubview(self.btnNext)
        self.btnNext.markRandom()
        self.btnNext.translatesAutoresizingMaskIntoConstraints = false
        self.btnNext.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        self.btnNext.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.btnNext.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.btnNext.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    // MARK: - Private Methods
    
    // MARK: - Actions
    @objc func clickBtnNext(_ sender: UIButton) {
        self.presenter?.showSettingsScreen()
    }
}

extension MainScreenViewController {
    func attach(presenter: MainScreenPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - MainScreenViewProtocol
extension MainScreenViewController: MainScreenViewProtocol {
    func showHUD() { }
    
    func hideHUD() { }
    
    func showError(_ error: String) { }
}
