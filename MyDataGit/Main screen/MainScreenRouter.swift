//  
//  MainScreenRouter.swift
//  MyDataGit
//
//  Created by Andrey Kulinskiy on 3/28/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

import UIKit

final class MainScreenRouter {
    
    // MARK: - property
    private weak var viewController: MainScreenViewController?
    
    // MARK: - Init
    
    // MARK: - Methods
    private func instantiateViewController() -> MainScreenViewController {
    
        let viewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
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

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    
}
