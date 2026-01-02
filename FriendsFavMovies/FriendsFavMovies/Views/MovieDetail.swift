//
//  MovieDetail.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import SwiftUI

struct MovieDetail: View {

    @Bindable var movie: Movie

    var body: some View {
        Form {
            TextField("Movie", text: $movie.title)
                .autocorrectionDisabled()

            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
    }
}

#Preview {
    MovieDetail(movie: SampleData.shared.movie)
}
