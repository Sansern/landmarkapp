//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Sansern Wuthirat on 10/21/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
                
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        return Group {
            LandmarkDetail(landmark: modelData.landmarks[0])
                .previewDevice("Apple Watch Series 6 - 40mm")
                .environmentObject(modelData)
            LandmarkDetail(landmark: modelData.landmarks[0])
                .previewDevice("Apple Watch Series 7 - 45mm")
                .environmentObject(modelData)
        }
    }
}