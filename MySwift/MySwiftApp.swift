//
//  MySwiftApp.swift
//  MySwift
//
//  Created by origin on 2021/11/25.
//

import SwiftUI

@main
struct MySwiftApp: App {
    // Use the @StateObject attribute to initialize a model object for a
    // given property only once during the life time of the app.
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
