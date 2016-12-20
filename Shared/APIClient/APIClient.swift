//
//  APIClient.swift
//  fastlanetest
//
//  Created by p_t on 12/19/16.
//  Copyright © 2016 p_t. All rights reserved.
//

import PromiseKit
import Alamofire
import Foundation


// MARK: APIError


public enum APIError: Error {
    case requestFailed(error: Error)
    case invalidResponse(responseObject: Any?)
    case parseFailed(object: Any?)
}


// MARK: APIClient


public final class APIClient {
    
    
    // MARK: Public
    
    
    @discardableResult
    public class func request<T: Request>(_ request: T) -> Promise<T.Response> {
        return Promise<T.Response> { fulfill, reject in
            Alamofire.request(request).responseJSON { response in
                guard response.result.error == nil else {
                    reject(APIError.requestFailed(error: response.result.error!))
                    return
                }
                
                guard let object = response.result.value else {
                    reject(APIError.invalidResponse(responseObject: nil))
                    return
                }
                
                guard let responseObject = request.response(from: object) else {
                    reject(APIError.parseFailed(object: object))
                    return
                }
                
                fulfill(responseObject)
            }
        }
    }
}
