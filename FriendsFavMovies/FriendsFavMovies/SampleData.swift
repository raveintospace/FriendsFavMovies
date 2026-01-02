//
//  SampleData.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()

    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }

    // Used in FriendDetail preview
    var friend: Friend {
        Friend.sampleData.first!
    }

    // Used in MovieDetail preview
    var movie: Movie {
        Movie.sampleData.first!
    }

    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])

        // Store data in memory without persisting it
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])

            insertSampleData()

            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    /// Generates Sample Data
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }

        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }
}
