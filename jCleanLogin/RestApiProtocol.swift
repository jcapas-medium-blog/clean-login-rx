//
//  RestApiProtocol.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

import RxSwift

public protocol RestApiProtocol{
    
    func login(email:String , password: String)->Observable<LoginEntity>
    
}


