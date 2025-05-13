//
//  FeedRouter.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 09/05/25.
//

import SwiftUI

class FeedRouter : FeedRouterProtocol {
    
    @MainActor
    static func CreateModule() -> AnyView {
        let interactor = FeedInteractor()
        let presenter = FeedPresenter(interactor: interactor)
        let view = FeedView(presenter: presenter)
        return AnyView(view)
    }
}

