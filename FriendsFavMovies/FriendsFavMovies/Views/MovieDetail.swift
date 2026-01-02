//
//  MovieDetail.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import SwiftUI
import SwiftData

struct MovieDetail: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Bindable var movie: Movie

    var body: some View {
        Form {
            TextField("Movie", text: $movie.title)
                .autocorrectionDisabled()

            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }

            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    context.delete(movie)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}
