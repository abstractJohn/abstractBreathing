//
//  Abstract_BreathingApp.swift
//  Abstract Breathing
//
//  Created by John Nelson on 2/4/22.
//

import SwiftUI

@main
struct Abstract_BreathingApp: App {
    let incidentsProvider = IncidentsProvider.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, incidentsProvider.container.viewContext)
                .onAppear(perform: HealthKitSetupAssistant.authorizeHealthKit)
        }
        
    }
}
