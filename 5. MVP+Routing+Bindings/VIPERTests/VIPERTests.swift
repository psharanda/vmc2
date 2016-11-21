//
//  VIPERTests.swift
//  VIPERTests
//
//  Created by Pavel Sharanda on 20.11.16.
//  Copyright © 2016 psharanda. All rights reserved.
//

import XCTest

class VIPERTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let res = "Lorem Ipsum"
        var config = TestContext.Config()
        config.text = res
        let context = TestContext(config: config)
        let (_, view) = context.makeMainModule()
        
        view.loadClick.update()
        
        XCTAssertEqual(view.text.lastValue!, res)
    }
    
}
