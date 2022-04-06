//
//  FavoriteButtonView.swift
//  Project2
//
//  Created by Liam Propst on 3/28/22.
//

import SwiftUI

//Also extracting out the favorite button view to declutter the main view

struct FavoriteButtonView: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isSet: .constant(true))
    }
}
