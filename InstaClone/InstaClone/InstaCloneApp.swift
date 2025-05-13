//
//  InstaCloneApp.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 25/03/25.
//

import SwiftUI

@main
struct InstaCloneApp: App {
    var body: some Scene {
        WindowGroup {
            let interactor = FeedInteractor()
            let presenter = FeedPresenter(interactor: interactor)
            FeedView(presenter: presenter)
        }
    }
}

/*
 
 then we’ll move on to Presenter tests or UI Tests, whichever you prefer next.
 
 */
