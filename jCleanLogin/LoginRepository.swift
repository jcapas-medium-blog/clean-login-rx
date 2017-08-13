//
//  UserRepository.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
@_exported import class RxSwift.Observable

public protocol LoginRepository{
    
    func login(email:String , password: String) -> Observable<Login>
    
}
