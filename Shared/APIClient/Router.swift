//
//  Router.swift
//  fastlanetest
//
//  Created by p_t on 12/19/16.
//  Copyright © 2016 p_t. All rights reserved.
//

import Alamofire
import ObjectMapper
import Foundation


enum RoutingError: Error {
    case buildURL
}


public protocol Request: URLRequestConvertible {
    associatedtype Response
    func response(from object: Any) -> Response?
}


extension Request where Response: Mappable {
    public func response(from object: Any) -> Response? {
        guard let entity = Mapper<Response>().map(JSONObject: object) else {
            return nil
        }
        return entity
    }
}


public struct Router {
    
    private static let baseURLString = "https://jsonplaceholder.typicode.com"
    
    static func apiBaseURL() -> URL {
        return URL(string: "\(Router.baseURLString)/")!
    }
}



// MARK: PostRouter


public extension Router {
    
    public struct Posts {
        
        public struct get: Request {
            let postId: Int
            
            public typealias Response = Post
            
            public init(postId: Int) {
                self.postId = postId
            }
            
            public func asURLRequest() throws -> URLRequest {
                let url = Router.apiBaseURL().appendingPathComponent("posts/\(postId)")
                return URLRequest(url: url)
            }
        }
    }
}
