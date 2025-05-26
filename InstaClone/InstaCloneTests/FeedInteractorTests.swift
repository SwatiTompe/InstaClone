//
//  FeedInteractorTests.swift
//  InstaCloneTests
//
//  Created by Techizer Mac02 on 10/05/25.
//

import XCTest
@testable import InstaClone

final class FeedInteractorTests: XCTestCase {
    
    func testFetchPOstsReturnPOsts() async {
        //Arrange
        let mockService = MockNetworkService()
        mockService.mockPOsts = [
            Post(id: 1, title: "test 1", url: "", thumbnailUrl: ""),
            Post(id: 2, title: "test 2", url: "", thumbnailUrl: "")
        ]
        
        let interactor = FeedInteractor(networkService: mockService)
        
        //Act
        let result = await interactor.fetchPosts()
        
        //Assert
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result.first?.title, "test 1")
        
    }
    
    func testFetchPOstsWithErrorReturnsEmptyArray() async {
        
        //Arrange
        let mockService = MockNetworkService()
        mockService.shouldREturnError = true
        
        let interactor = FeedInteractor(networkService: mockService)
        
        //Act
        let result = await interactor.fetchPosts()
        
        //Assert
        XCTAssertTrue(result.isEmpty)
    }
}


