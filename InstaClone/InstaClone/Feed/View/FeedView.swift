import SwiftUI

struct FeedView: View {
    @ObservedObject var presenter : FeedPresenter
    
    var body: some View {
        List(presenter.posts) { post in
            Text(post.title)//PostTitle_1
                .accessibilityIdentifier("PostTitle_\(post.id)")
        }
        .onAppear {
            Task {
                
                await presenter.loadPosts()
            }
        }
        .alert(isPresented: .constant(presenter.errorMessage != nil)) {
            Alert(title: Text("Error"),
                  message: Text(presenter.errorMessage ?? "Unknown error"),
                  dismissButton: .default(Text("OK"), action: {
                presenter.errorMessage = nil
            }))
        }
    }
}



