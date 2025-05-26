//
//  InstaCloneApp.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 25/03/25.
//

import SwiftUI

@main
struct InstaCloneApp: App {
    
    init() {
        
//        let networkService = NetworkManager()
//        let interactor = FeedInteractor(networkService: networkService)
        
        
        let interactor : FeedInteractorProtocol
        
        //Check if app is running for UI testing
        if ProcessInfo.processInfo.environment["UITEST_MOCK_ENABLED"] == "1" {
            interactor = MockFeedInteractor()
        }
        else {
            let networkService = NetworkManager()
            interactor = FeedInteractor(networkService: networkService)
        }

        //.................................
        
        //Register interactor
        DIContainer.shared.register(interactor as FeedInteractorProtocol)
        
        
        //register your presenter
        let presenter = FeedPresenter(interactor: interactor)
        DIContainer.shared.register(presenter, for: FeedPresenter.self)
        
    }
    
    
    var body: some Scene {
        WindowGroup {
            //start with the router that used DI
            FeedRouter.CreateModule()
        }
    }
}


