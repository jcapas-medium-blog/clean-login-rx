//
//  LoginPresenter.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class LoginPresenter  {
    
    var loginSuscribe : Disposable!
    let interactor :LoginInteractor!
    
    public var viewController : LoginProtocol!
    
    init(interactor:LoginInteractor){
        
        self.interactor = interactor
        self.viewController = nil
    }
    
    
    
    func login(){
        print("Click in LoginPresenter")
        
        let username = viewController.getUserName()
        let password = viewController.getPassword()
        
        self.viewController.showLoading()
        self.loginObservable(email: username!, password: password!)
    }
    
    
    func loginObservable(email:String , password: String)->Void{
        
        self.loginSuscribe = self.interactor.login(email: email, password: password).observeOn(MainScheduler.instance)
            .subscribe(
                onNext:next(),
                onError: error(),
                onCompleted: completed(),
                onDisposed: disposed())
    }
    
    //MARK: - RESULT OBSERVABLE
    
    
    func completed()-> ()-> Void{
        print("COMPLETED")
        let onCompleted:()->Void = {
            self.viewController.hideLoading()
            self.viewController.gotoHome()
        }
        return onCompleted
    }
    
    func next()->(Login)->Void {
        print("NEXT")
        let onNext:(Login)->Void = {login in
            //let userModel:UserModel = UserModel.mapper(user: user)
            //_ = self.loginView.onLoginSuccess(userModel: userModel)
            print("Bienvenido \(String(describing: login.user?.first_name))")
        }
        return onNext
    }
    
    func error()->(Error)->Void{
        print("ERROR")
        let onError:(Error)->Void = { error in
            _ = self.viewController.hideLoading()
            //_ = self.loginView.showErrorCustom(error: error as! ErrorResult)
        }
        return onError
    }
    
    func disposed()->()->Void{
        print("DISPOSED")
        let onDisposed:()->Void = {_ in
        }
        return onDisposed
    }
}
