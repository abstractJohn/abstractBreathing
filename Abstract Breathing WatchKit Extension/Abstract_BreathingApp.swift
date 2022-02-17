//
//  Abstract_BreathingApp.swift
//  Abstract Breathing WatchKit Extension
//
//  Created by John Nelson on 2/4/22.
//

import SwiftUI

@main
struct Abstract_BreathingApp: App {
    let incidentsProvider = IncidentsProvider.shared
    @SceneBuilder var body: some Scene {
        WindowGroup {
            
                ContentView()
                    .environment(\.managedObjectContext, incidentsProvider.container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
