//
//  ContentView.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/13/21.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Turtle Rock")
                .font(.title)
            
            HStack {
                Text("Joshua Tree National Park")
                Spacer()
                Text("California")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
