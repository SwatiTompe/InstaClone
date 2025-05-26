//
//  NetworkManager.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 18/05/25.
//

import Foundation


protocol NetworkService {
    func fetch<T: Decodable>(_ type: T.Type, from url:URL) async throws -> T
}

class MockNetworkService : NetworkService {
    var shouldREturnError = false
    var mockPOsts: [Post] = []
    
    
    func fetch<T>(_ type: T.Type, from url: URL) async throws -> T where T : Decodable {
        
        if shouldREturnError {
            throw URLError(.badServerResponse)
        }
        
        guard let result = mockPOsts as? T else {
            throw URLError(.cannotDecodeContentData)
        }
        return result
    }
}

class NetworkManager : NetworkService {
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }

        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
}


