//
//  LoginConfigurator.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

class LoginConfigurator{
    
    // MARK: Object lifecycle
    static let sharedInstance: LoginConfigurator = {
        let instance = LoginConfigurator()
        return instance
    }()
    
    // MARK: Configuration
    func configure(_ viewController: LoginViewController){
        
        let router = LoginRouter()
        router.viewController = viewController
        
        let repository: LoginRepository = LoginDataRepository.sharedInstance
        let interactor = LoginInteractor(repository: repository)
        
        let presenter = LoginPresenter(interactor: interactor)
        presenter.viewController = viewController
        
        viewController.router = router
        viewController.presenter = presenter
        viewController.presenter?.viewController = viewController
    }
    
    
}
