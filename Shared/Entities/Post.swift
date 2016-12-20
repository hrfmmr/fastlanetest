//
//  Post.swift
//  fastlanetest
//
//  Created by p_t on 12/19/16.
//  Copyright © 2016 p_t. All rights reserved.
//

import ObjectMapper
import Foundation

public class Post: Mappable {
    public var userId: Int?
    public var id: Int?
    public var title: String?
    public var body: String?

    required public init(map: Map) {
    }

    public func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}


extension Post: CustomStringConvertible {
    
    public var description: String {
        return  "userId:\(userId)" +
            "id:\(id)" +
            "title:\(title)" +
        "body:\(body)"
    }
}
