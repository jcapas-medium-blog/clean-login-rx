//
//  RestApi.swift
//  Olimpo
//
//  Created by jcapasix on 6/7/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import ReachabilitySwift

class RestApi: RestApiProtocol{

    public static let sharedInstance = RestApi()
    var alamofireManager : Alamofire.SessionManager?
    
    private init() {
        
        let configuration = URLSessionConfiguration.default
        //configuration.timeoutIntervalForResource = 30
        self.alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    let reachability = Reachability()
    var requestAlamo:Alamofire.DataRequest?
    
    let headers = [
        "Content-Type": "application/json"
    ]
    
    // MARK: - METHODS
    
    public  func login(email:String , password: String)->Observable<LoginEntity>{
        
        return Observable.create { (observer) -> Disposable in
            
            if(self.isThereNetworkConnection()){
                
                let URI = "/auth/login/"
                
                let url = AppEnvironment.configuration.serverURL + URI
                
                let bodyLogin : [ String : Any] = [
                    "username":email,
                    "password":password,
                ]
                
                self.alamofireManager?.request(url, method:.post, parameters: bodyLogin, encoding: JSONEncoding.default,headers: self.headers).debugLog().responseObject(keyPath: ""){ (response:DataResponse<LoginEntity>) in
                    
                    
                    print(NSString(data:response.data!, encoding:String.Encoding.utf8.rawValue)!.trimmingCharacters(in: .whitespacesAndNewlines))
                    print(response)
                
                    
                    switch response.result {
                    case .success:
                        print("Success Jordan")
                        if(response.response?.statusCode == 200){
                            print("200")
                            let userEntity = response.result.value
                                
                            observer.onNext(userEntity!)
                            observer.onCompleted()
                        }
                        if(response.response?.statusCode == 400){
                            print("400")
//                            observer.onError(ErrorResult(messageError: ErrorMessage.DefaultError.rawValue,codeError:ErrorCodeGeneral.DefaultError))
                        }
                    case .failure(let error):
                        print("failure Jordan")
                        print(error)
//                        observer.onError(ErrorResult(messageError: ErrorMessage.DefaultError.rawValue,codeError:ErrorCodeGeneral.DefaultError))
//                        
                    }
                    
                }
                
            }
            return Disposables.create{
                
            }
        }
    }
    
    
    public func isThereNetworkConnection()->Bool{
        var isConnected:Bool
        isConnected = (self.reachability?.isReachable)!
        return isConnected
    }

}


extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(NSString(data: (self.request?.httpBody)!, encoding:String.Encoding.utf8.rawValue)!)
        #endif
        return self
    }
}
