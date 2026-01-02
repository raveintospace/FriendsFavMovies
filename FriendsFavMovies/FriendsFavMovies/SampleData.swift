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

        Friend.sampleData[0].favMovie = Movie.sampleData[1]
        Friend.sampleData[2].favMovie = Movie.sampleData[0]
        Friend.sampleData[3].favMovie = Movie.sampleData[4]
        Friend.sampleData[4].favMovie = Movie.sampleData[0]
    }
}

/*
 When setting the value of a property at one end of a relationship (favoriteMovie), SwiftData automatically updates the corresponding property on the other end (favoritedBy) for you. You can choose which of the two properties to set.

 If not, we would have to do something like this:
    Movie.sampleData[0].favoritedBy = [Friend.sampleData[2], Friend.sampleData[3]]
 */
