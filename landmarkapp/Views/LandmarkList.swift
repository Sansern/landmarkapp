//
//  LandmarkList.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/14/21.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
//    Compute a filtered version of the landmarks list by checking the showFavoritesOnly property and each landmark.isFavorite value.
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {

        NavigationView {
            
            //  The model data’s landmarks array to the List initializer.
        
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                            .padding(.vertical, 8.0)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
        
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkList()
            LandmarkList()
                .previewDevice("iPod touch (7th generation)")
            LandmarkList()
                .previewDevice("iPhone 13 Pro Max")
        }
    }
}
