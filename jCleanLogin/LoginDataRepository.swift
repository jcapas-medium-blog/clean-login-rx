//
//  UserDataRepository.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
public class LoginDataRepository:LoginRepository {
    
    public static let sharedInstance = LoginDataRepository()
    
    let restApi:RestApi = RestApi.sharedInstance
    
    init() {}
    
    
    public  func login(email:String , password: String) -> Observable<Login>{
        return  restApi.login(email: email, password: password).map{
            LoginEntity.mapper(loginEntity:$0)
        }
    }
    

    
    
    
}
