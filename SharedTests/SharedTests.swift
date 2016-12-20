//
//  SharedTests.swift
//  SharedTests
//
//  Created by p_t on 12/16/16.
//  Copyright © 2016 p_t. All rights reserved.
//

import XCTest
import Nimble
import Quick
@testable import Shared

class SharedTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let a = 1
        let b = 2
        XCTAssertEqual(add(a, b), 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}


class APIClientSpec: QuickSpec {
    override func spec() {
        describe("/posts") {
            it("check response", closure: {
                _ = APIClient.request(Router.Posts.get(postId: 1)).then { post -> Void in
                    expect(post.id).toEventuallyNot(beNil())
                    expect(post.id!).toEventually(equal(1))
                }
            })
        }
    }
}
