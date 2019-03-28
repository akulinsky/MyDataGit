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
    
    var lblName: UILabel = {
        let view: UILabel = UILabel()
        view.backgroundColor = UIColor.clear
        view.textColor = UIColor.redColor
        view.font = UIFont.boldSystemFont(ofSize: 17)
        view.textAlignment = .center
        view.text = "Main Screen"
        return view
    }()
    
    // MARK: - Init
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Main Screen"
        self.view.backgroundColor = UIColor.white
        
        self.presenter?.didLoad()
        
        self.view.addSubview(self.lblName)
        self.lblName.sizeToFit()
        self.lblName.markRandom()
        self.lblName.translatesAutoresizingMaskIntoConstraints = false
        self.lblName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        self.lblName.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20).isActive = true
        self.lblName.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    // MARK: - Private Methods
    
    // MARK: - Actions
    
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
