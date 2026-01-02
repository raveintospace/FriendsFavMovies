//
//  FriendDetail.swift
//  FriendsFavMovies
//
//  Created by Uri on 2/1/26.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @Bindable var friend: Friend

    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    dismiss()
                }
            }

            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    context.delete(friend)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}

/*
Making friend a @Bindable property lets you pass a binding to it, or to its properties, into controls like text fields. This works because all model classes in SwiftData are observable, which allows SwiftUI to track changes to their properties.
 */
