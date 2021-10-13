//
//  LandmarkRow.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/14/21.
//

import SwiftUI

struct LandmarkRow: View {
    
    // Add landmark as a stored property of LandmarkRow.
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[0])
    }
}
