//
//  githubfollowersappApp.swift
//  githubfollowersapp
//
//  Created by Pablo Nicoli on 19/03/2025.
//

import SwiftUI
import SwiftData

@main
struct GithubfollowersappApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SearchViewControllerRepresentable()
            }
        }
    }
}

struct SearchViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SearchViewController {
        return SearchViewController()
    }

    func updateUIViewController(_ uiViewController: SearchViewController, context: Context) {
        // Update the view controller if needed
    }
}
