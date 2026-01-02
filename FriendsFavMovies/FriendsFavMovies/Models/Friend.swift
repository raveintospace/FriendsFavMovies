//
//  Friend.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String

    init(name: String) {
        self.name = name
    }

    static let sampleData = [
        Friend(name: "Dani"),
        Friend(name: "Larry"),
        Friend(name: "Oscar"),
        Friend(name: "Junai"),
        Friend(name: "Coen"),
    ]
}
