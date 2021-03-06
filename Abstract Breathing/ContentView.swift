//
//  ContentView.swift
//  Abstract Breathing
//
//  Created by John Nelson on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Incident.time, ascending: true)], animation: .default)
    private var incidents: FetchedResults<Incident>
    @State var settingsOpen: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(incidents) { incident in
                    NavigationLink {
                        Text("Incident at \(incident.time!, formatter: incidentFormatter)")
                    } label: {
                        Text(incident.time!, formatter: incidentFormatter)
                    }
                }
            }
            .navigationTitle("Breathing Incidents")
            .toolbar() {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(){
                        settingsOpen = true
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $settingsOpen, onDismiss: {settingsOpen = false}) {
                SettingsView()
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private let incidentFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
