//
//  LoginProtocol.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation

protocol LoginProtocol{
    
    func showLoading()
    func hideLoading()
    func gotoHome()
    func getUserName()->String?
    func getPassword()->String?
}
