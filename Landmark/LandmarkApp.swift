//
//  LandmarkApp.swift
//  Landmark
//
//  Created by origin on 2021/11/25.
//

import SwiftUI

@main
struct LandmarkApp: App {
    // Use the @StateObject attribute to initialize a model object for a
    // given property only once during the life time of the app.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
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
}
