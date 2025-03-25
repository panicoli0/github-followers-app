import SwiftUI

struct SearchView: View {
    @State private var username: String = ""
    @State private var showAlert = false
    @State private var navigateToFollowers = false
    
    var body: some View {
        NavigationStack {  // Changed from NavigationView to NavigationStack
            VStack(spacing: 20) {
                Spacer()
                
                // Logo Image
                Image("gh-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                // Username TextField
                TextField("Enter a username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .padding(.horizontal, 50)
                
                Spacer()
                
                // Get Followers Button
                Button(action: getFollowersTapped) {
                    Text("Get Followers")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                .padding(.bottom, 50)
            }
            .navigationBarHidden(true)
            .alert("Empty Username", isPresented: $showAlert) {
                Button("Ok", role: .cancel) { }
            } message: {
                Text("Please enter a username. We need to know who to look for 😀")
            }
            .navigationDestination(isPresented: $navigateToFollowers) {
                FollowersListView(username: username)
            }
        }
    }
    
    private func getFollowersTapped() {
        if username.isEmpty {
            showAlert = true
            return
        }
        navigateToFollowers = true
    }
}

#Preview {
    SearchView()
}
