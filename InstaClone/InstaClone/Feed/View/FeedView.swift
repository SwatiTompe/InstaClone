import SwiftUI

struct FeedView: View {
    
    @StateObject private var presenter : FeedPresenter
    
    init(presenter:FeedPresenter) {
        _presenter = StateObject(wrappedValue: presenter)
    }
    
    var body: some View {
        NavigationView {
            List(presenter.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.url)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .lineLimit(1)
                }
            }
            .navigationTitle("Instaclone Feed")
            .onAppear() {
                presenter.loadPosts()
            }
        }
    }
}

/*
 lets continue by adding Unit and ui tests to your SwiftUI viper architecture
 we will test if feedintercator correctly fetched posts from the api
 
 
 
 
 
 */
