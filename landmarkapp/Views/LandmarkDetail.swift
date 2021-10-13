//
//  LandmarkDetail.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/14/21.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300.0)
            
            CircleImage()
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Describetive text goes here.")
                
                Spacer()
                
            }
            .padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}
