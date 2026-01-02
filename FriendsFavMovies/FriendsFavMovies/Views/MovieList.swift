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
        NavigationSplitView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(movie.title) {
                        MovieDetail(movie: movie)
                    }
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem {
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
            }
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

extension MovieList {

    private func addMovie() {
        context.insert(Movie(title: "New movie", releaseDate: .now))
    }
}
