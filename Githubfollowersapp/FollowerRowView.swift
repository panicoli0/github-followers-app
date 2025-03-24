import SwiftUI

struct FollowerRowView: View {
    let follower: Follower
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: follower.avatarUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                case .failure(_):
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                @unknown default:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                }
            }
            .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(follower.login)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
