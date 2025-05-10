//
//  FeedRouter.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 09/05/25.
//

import SwiftUI

class FeedRouter : FeedRouterProtocol {
    static func CreateModule() -> FeedView {
        let interactor = FeedInteractor()
        let view = FeedView()
        let presenter = FeedPresenter(interactor: interactor, view: view)
        view.presenter = presenter
        return view
    }
}

