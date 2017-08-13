//
//  Response.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation


public class Response: NSObject {
    
    var responseCode :Int
    var responseDescription:String?
    
    public init(responseCode:Int,responseDescription:String?) {
        
        self.responseCode = responseCode
        self.responseDescription = responseDescription
    }
}
