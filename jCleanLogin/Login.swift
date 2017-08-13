//
//  User.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

public class User: NSObject{

    public var username:String?
    public var email:String?
    public var first_name:String?
    public var last_name:String?

    public init(username:String?, email:String?, first_name:String?, last_name:String?) {
        
        self.username = username
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
    }
    
}


public class Login: NSObject {
    
    public var token:String?
    public var is_security:Bool
    public var user:User?
    
    public init(token:String?, is_security:Bool, user:User?) {
    
        self.token = token
        self.is_security = is_security
        self.user = user
    }
    
}
