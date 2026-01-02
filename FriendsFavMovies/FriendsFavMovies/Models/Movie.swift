//
//  Movie.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate: Date

    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
