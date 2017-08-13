//
//  Configuration.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import UIKit

public enum Environment: String {
    
    case Development
    case Production
    case ProductionPilot
}

public let AppEnvironment = Environment.Development


public protocol Configuration {
    /// URL of the REST server
    static var serverURL: String { get }
    }



public struct ProductionPilotConfig: Configuration {
    
    public static let serverURL = "http://olimpo.capuly.com/api"

}

public struct ProductionConfig: Configuration {
    
    
    public static let serverURL = "http://olimpo.capuly.com/api"
}

public struct DevelopConfig: Configuration {
    
    public static let serverURL = "http://olimpo.capuly.com/api"
    
}

public extension Environment {
    
    var configuration: Configuration.Type {
        switch self {
        case .Development: return DevelopConfig.self
        case .Production: return ProductionConfig.self
        case .ProductionPilot: return ProductionPilotConfig.self
        }
    }
}
