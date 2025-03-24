import SwiftUI

struct FollowersListView: View {
    let username: String
    @State private var followers: [Follower] = []
    @State private var isLoading = false
    @State private var errorMessage = ""
    @State private var showError = false
    
    // Define grid layout
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(followers, id: \.id) { follower in
                    FollowerCardView(follower: follower)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(username)
        .onAppear(perform: getFollowers)
        .alert("Error", isPresented: $showError) {
            Button("Ok", role: .cancel) { 
                errorMessage = ""
            }
        } message: {
            Text(errorMessage)
        }
    }
    
    private func getFollowers() {
        isLoading = true
        NetworkManager.shared.getFollowers(for: username) { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let followers):
                    self.followers = followers
                case .failure(let error):
                    errorMessage = error.localizedDescription
                    showError = true
                }
            }
        }
    }
}
