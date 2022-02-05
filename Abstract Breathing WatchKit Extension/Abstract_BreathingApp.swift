//
//  Abstract_BreathingApp.swift
//  Abstract Breathing WatchKit Extension
//
//  Created by John Nelson on 2/4/22.
//

import SwiftUI

@main
struct Abstract_BreathingApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
