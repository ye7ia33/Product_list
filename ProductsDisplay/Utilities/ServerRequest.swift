//
//  ServerRequest.swift
//  Created by Yahia El-Dow on 6/24/17.
//  Copyright © 2017 Production Code. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Server : NSObject {
    static let httpMethod_GET    =  HTTPMethod.get
    static let httpMethod_POST   =  HTTPMethod.post
    static let httpMethod_PUT    =  HTTPMethod.put
    static let httpMethod_DELETE =  HTTPMethod.delete
    
    static let urlEncoding = URLEncoding.default
    static let headers = ["Content-Type": "application/x-www-form-urlencoded" ,
                          "Cache-Control": "no-cache"]
    
    static let errorMSG = "Error, Please tray again"
    
    
    
    class func GetRequest (request_url : String , Result:@escaping(_ result : Any)->() ) {
      
//        UIViewController.root().view.addSubview(indicator)
        print(request_url)
        Alamofire.request( request_url ,
            method: httpMethod_GET ,
            encoding: urlEncoding  ,
            headers: headers )
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: {
                response in
                switch response.result
                {
                case .failure(let error) :
                    print("> Error on Response JSON " , error)
                    Result(NSNull())
                    break
                case .success(let requestResult):
                    Result(requestResult)
                    break
                }
                
            Result(NSNull())
            return
        })
    }

    class func POSTRequest (request_url : String , params : [String : Any] = [String : Any]() ,
                            Result:@escaping(_ result : Any)->() ) {
  
        print(request_url)

        Alamofire.request(request_url ,
                          method: httpMethod_POST ,
                          parameters: params ,
                          encoding: urlEncoding  ,
                          headers: headers )
            .validate(statusCode: 200..<300)
            .responseJSON(completionHandler: {
                response in
                switch response.result
                {
                case .failure(let error) :
                    print("> Error on Response JSON " , error)
                    Result(NSNull())
                    break
                case .success(let value):
                    Result(value)
                    break
                }
            })
    }
    
    
    
}


