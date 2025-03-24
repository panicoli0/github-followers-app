import SwiftUI

struct FollowerCardView: View {
    let follower: Follower
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: follower.avatarUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 90, height: 90)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(Circle())
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                case .failure(_):
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray.opacity(0.3))
                @unknown default:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray.opacity(0.3))
                }
            }
            
            Text(follower.login)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .padding(.horizontal, 8)
        }
        .frame(width: 110, height: 130)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

// Preview provider for development
#Preview {
    FollowerCardView(follower: Follower(id: 1, login: "octocat", 
                                        avatarUrl: "https://avatars.githubusercontent.com/u/583231?v=4",
                                        htmlUrl: ""
                                      ))
        .previewLayout(.fixed(width: 110, height: 130))
}
