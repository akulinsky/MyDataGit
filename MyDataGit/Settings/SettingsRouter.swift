//  
//  SettingsRouter.swift
//  MyDataGit
//
//  Created by Andrey Kulinskiy on 3/28/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

import UIKit

final class SettingsRouter {
    
    // MARK: - property
    private weak var viewController: SettingsViewController?
    
    // MARK: - Init
    
    // MARK: - Methods
    private func instantiateViewController() -> SettingsViewController {
    
        let viewController = SettingsViewController()
        let presenter = SettingsPresenter()
        presenter.attach(router: self)
        presenter.attach(view: viewController)
        viewController.attach(presenter: presenter)
    
        self.viewController = viewController
    
        return viewController
    }
    
    func push(to: UINavigationController?, animated: Bool = true) {
        to?.pushViewController(instantiateViewController(), animated: animated)
    }
    
    func present(to: UIViewController?, animated: Bool = true) {
        to?.present(instantiateViewController(), animated: animated, completion: nil)
    }
    
    func create() -> UIViewController {
        return self.instantiateViewController()
    }
}

// MARK: - SettingsRouterProtocol
extension SettingsRouter: SettingsRouterProtocol {
    
}
