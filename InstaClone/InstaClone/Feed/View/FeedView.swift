//
//  FeedView.swift
//  InstaClone
//
//  Created by Techizer Mac02 on 28/03/25.
//

import SwiftUI

struct FeedView : View {
    @ObservedObject var presenter : FeedPresenter
    
    var body: some View {
        NavigationView {
            List(presenter.posts) { post in
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: post.url)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 200)
                    .cornerRadius(10)
                    
                    Text(post.title)
                        .font(.headline)
                        .padding(.top,5)

                }
                .padding()
            }
            .navigationTitle("Instaclone Feed")
            .onAppear {
                presenter.
            }
        }
    }
}
