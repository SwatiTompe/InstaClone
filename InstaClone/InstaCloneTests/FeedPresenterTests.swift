//
//  FeedPresenterTests.swift
//  InstaCloneTests
//
//  Created by Techizer Mac02 on 15/05/25.
//

import XCTest
@testable import InstaClone
import Combine

class FeedPresenterTests: XCTestCase {
    
    //Mock Interactor
    class MockFeedInteractor : FeedInteractorProtocol {
        
        let samplePosts = [
            Post(id: 1, title: "Sample 1", url: "", thumbnailUrl: ""),
            Post(id: 2, title: "Sample 2", url: "", thumbnailUrl: "")
        ]
        
        func fetchPosts() async -> [Post] {
            return samplePosts
        }
        
    }
    
    @MainActor
    func testLoadPostsPublishesPost() async {
        //Arrange
        let mockInteractor = MockFeedInteractor()
        let presenter = await FeedPresenter(interactor: mockInteractor)
        
        //Observe published posts change
        let expectation = XCTestExpectation(description: "Posts updated")
        
        
        var cancellable : Any?
        cancellable = await presenter.$posts
            .dropFirst()
            .sink { posts in
                if posts.count == 2 {
                    expectation.fulfill()
                }
            }
        
        
        //Act
        await presenter.loadPosts()
        
        
        
        //Assert
        wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(presenter.posts.count, 2)
        
        
        //cleanup
        if let cancellable = cancellable as? AnyCancellable {
            cancellable.cancel()
        }
    }
}

/*
 we are using combines .sink to observe @Published changes
 .dropFirst() skips the initial empty array
 we  call await presenter.loadPosts() to trigger the update
 we check that posts.count == 2 and fulfill the expectation
 then we assert the presenter state with XCTassertEqual.
 
 
 */

