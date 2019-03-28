//  
//  SettingsPresenter.swift
//  MyDataGit
//
//  Created by Andrey Kulinskiy on 3/28/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

final class SettingsPresenter {
    // MARK: - property
    private var router: SettingsRouterProtocol?
    private weak var view: SettingsViewProtocol?
    
    // MARK: - Init
    
    // MARK: - Private Methods
    
}

// MARK: - SettingsPresenterProtocol
extension SettingsPresenter: SettingsPresenterProtocol {
    func didLoad() {
        print(#function)
    }
    
    func reloadData() {
        print(#function)
    }
}

extension SettingsPresenter {
    func attach(router: SettingsRouterProtocol) {
        self.router = router
    }
    
    func attach(view: SettingsViewProtocol) {
        self.view = view
    }
}
