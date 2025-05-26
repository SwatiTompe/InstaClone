//
//  FeedViewUITests.swift
//  InstaCloneTests
//
//  Created by Techizer Mac02 on 17/05/25.
//

import XCTest

class FeedViewUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        app.launchEnvironment["UITEST_MOCK_ENABLED"] = "1"  // Important!
        app.launch()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFeedViewLoadPosts() {
        let firstPostTitle = app.staticTexts["PostTitle_1"]
        let secondPOstTitle = app.staticTexts["PostTitle_2"]
        
        let exists = NSPredicate(format: "exists == true")
        
        expectation(for: exists, evaluatedWith: firstPostTitle, handler: nil)
        expectation(for: exists, evaluatedWith: secondPOstTitle, handler: nil)
        
        waitForExpectations(timeout: 5)
    }
}























