//
//  landmarkappApp.swift
//  landmarkapp
//
//  Created by Sansern Wuthirat on 10/13/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
