//
//  MovieList.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import SwiftUI
import SwiftData

struct MovieList: View {

    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            ForEach(movies) { movie in
                Text(movie.title)
            }
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
