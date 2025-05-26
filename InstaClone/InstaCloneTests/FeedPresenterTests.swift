//
//  FeedPresenterTests.swift
//  InstaCloneTests
//
//  Created by Techizer Mac02 on 15/05/25.
//

import XCTest
@testable import InstaClone
import Combine
import SwiftUI

enum MockError : Error {
    case networkFailure
}

class MockFailingInteractor : FeedInteractorProtocol {
    func fetchPosts() async -> [Post] {
        return [] //simulate empty or failed fetch
    }
}


@MainActor
class FeedPresenterTests: XCTestCase {
    
    @MainActor
    func testPostsInitiallyEmpty() {
        let mockInteractor = MockFeedInteractor()
        let presenter = FeedPresenter(interactor: mockInteractor)
        XCTAssertTrue(presenter.posts.isEmpty,"Posts should be empty on init")
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
                print("Posts received: \(posts.count)")
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
    
    @MainActor
    func testLoadPostsWithEmptyResult() async {
       
        //Arrange
        let mockInteractor = MockFailingInteractor()
        let presenter = await FeedPresenter(interactor: mockInteractor)
        
        let expectation = XCTestExpectation(description: "Posts should be empty")
            
        var cancellable : Any?
        cancellable = await presenter.$posts
            .dropFirst()
            .sink { posts in
                if posts.isEmpty {
                    expectation.fulfill()
                }
                
            }
        
        //Act
        await presenter.loadPosts()
        
        //Assert
        wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(presenter.posts.count, 0)
        
        if let cancellable = cancellable as? AnyCancellable {
            cancellable.cancel()
        }
    }
    
}


