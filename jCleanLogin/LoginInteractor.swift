//
//  LoginInteractor.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import RxSwift


public class Interactor{
    
    let disposeBag = DisposeBag()
    var repository : Any
    
    public init(repository:Any){
        self.repository = repository
    }
}


public class LoginInteractor: Interactor{
    
    public func login(email:String , password: String)->Observable<Login>{
        return (self.repository as! LoginRepository).login(email:email, password:password)
    }
}
