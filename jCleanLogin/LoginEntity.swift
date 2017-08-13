//
//  UserEntity.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import ObjectMapper

public class UserEntity: Mappable  {
    public var username:String?
    public var email:String?
    public var first_name:String?
    public var last_name:String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        self.username   <- map["username"]
        self.email      <- map["email"]
        self.first_name <- map["first_name"]
        self.last_name  <- map["last_name"]
    }
    
    
}

extension UserEntity{
    
    class func mapper(userEntity:UserEntity) -> User{
        return User(username:userEntity.username,
                    email:userEntity.email,
                    first_name: userEntity.first_name,
                    last_name: userEntity.last_name)
    }
    
}


public class LoginEntity: Mappable  {
    
    var token:String?
    var is_security:Bool?
    var user:UserEntity?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        self.token         <- map["token"]
        self.is_security   <- map["is_security"]
        self.user          <- map["user"]
    }
    

}

extension LoginEntity{
    
    class func mapper(loginEntity:LoginEntity) -> Login{
        return Login(token:loginEntity.token,
                    is_security:loginEntity.is_security!,
                    user: UserEntity.mapper(userEntity: loginEntity.user!))
    }

}
