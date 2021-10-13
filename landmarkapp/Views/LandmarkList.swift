//
//  LandmarkList.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/14/21.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
//     The model data’s landmarks array to the List initializer.
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
        
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
