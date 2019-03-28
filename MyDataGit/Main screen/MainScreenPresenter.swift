//  
//  MainScreenPresenter.swift
//  MyDataGit
//
//  Created by Andrey Kulinskiy on 3/28/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

final class MainScreenPresenter {
    // MARK: - property
    private var router: MainScreenRouterProtocol?
    private weak var view: MainScreenViewProtocol?
    
    // MARK: - Init
    
    // MARK: - Private Methods
    
}

// MARK: - MainScreenPresenterProtocol
extension MainScreenPresenter: MainScreenPresenterProtocol {
    func didLoad() {
        print(#function)
    }
    
    func reloadData() {
        print(#function)
    }
    
    func showSettingsScreen() {
        self.router?.presentSettingsScreen()
    }
}

extension MainScreenPresenter {
    func attach(router: MainScreenRouterProtocol) {
        self.router = router
    }
    
    func attach(view: MainScreenViewProtocol) {
        self.view = view
    }
}
