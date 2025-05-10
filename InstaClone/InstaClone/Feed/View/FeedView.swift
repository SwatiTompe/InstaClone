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
 uses @MainActor to safely update the UI
 uses @Published to reflect data in the view
 uses async/await to simplify networking
 fully swiftUi compatible
 VIPER separation
 
 
 
 
 
 */
