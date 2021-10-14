//
//  FavoriteButton.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/15/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                isSet.toggle()
            }) {
                Image(systemName: isSet ? "star.fill" : "star")
            }
            
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
