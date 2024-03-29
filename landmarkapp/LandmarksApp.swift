import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        let mainWindow = WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }

        #if os(macOS)
        mainWindow
            .commands {
                LandmarkCommands()
            }
        #else
        mainWindow
        #endif

        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif

        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(modelData)
//        }
//        #if !os(watchOS)
//        .commands {
//            LandmarkCommands()
//        }
//        #endif
//
//        #if os(watchOS)
//        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
//        #endif
//    }
}
