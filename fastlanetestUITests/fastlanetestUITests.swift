//
//  fastlanetestUITests.swift
//  fastlanetestUITests
//
//  Created by p_t on 12/16/16.
//  Copyright © 2016 p_t. All rights reserved.
//

import XCTest

class fastlanetestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMain() {
        let app = XCUIApplication()
        
        snapshot("01_before_button_tapped")
        XCTAssertFalse(app.staticTexts["hello, world"].exists)
        XCTAssertTrue(app.buttons["Button"].exists)
        app.buttons["Button"].tap()
        XCTAssertTrue(app.staticTexts["hello, world"].exists)
        snapshot("02_after_button_tapped")
    }
}
