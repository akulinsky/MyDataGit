//  
//  SettingsProtocols.swift
//  MyDataGit
//
//  Created by Andrey Kulinskiy on 3/28/19.
//  Copyright © 2019 Andrey Kulinskiy. All rights reserved.
//

protocol SettingsViewProtocol: class {
    // PRESENTER -> VIEW
    func showHUD()
    func hideHUD()
    func showError(_ error: String)
}

protocol SettingsPresenterProtocol: class {
    // VIEW -> PRESENTER
    func didLoad()
    func reloadData()
}

protocol SettingsRouterProtocol: class {
    // PRESENTER -> ROUTER
}

