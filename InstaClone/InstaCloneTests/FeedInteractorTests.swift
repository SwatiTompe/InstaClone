//
//  FeedInteractorTests.swift
//  InstaCloneTests
//
//  Created by Techizer Mac02 on 10/05/25.
//

import XCTest
@testable import InstaClone

final class FeedInteractorTests: XCTestCase {
    
    var interactor : FeedInteractor!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = FeedInteractor()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        interactor = nil
    }

    func testFetchPostsReturnsData() async throws {
        let posts = await interactor.fetchPosts()
        XCTAssertFalse(posts.isEmpty, "Expected non-empty posts array")
    }
    

}
