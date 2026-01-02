//
//  FriendsFavMoviesApp.swift
//  FriendsFavMovies
//  https://developer.apple.com/tutorials/develop-in-swift/navigate-sample-data
//  Created by Uri on 2/1/26.
//

import SwiftUI
import SwiftData

@main
struct FriendsFavMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Friend.self, Movie.self])
    }
}
