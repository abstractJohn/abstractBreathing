//
//  ContentView.swift
//  Abstract Breathing WatchKit Extension
//
//  Created by John Nelson on 2/4/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Medication.name, ascending: true)], animation: .default)
    private var medications: FetchedResults<Medication>
    @State var medication: Medication?
    var body: some View {
        VStack {
            Picker(selection: $medication) {
                    ForEach(medications) { med in
                        Text(med.name ?? "")
                    }
            } label: {
                Text("Medication")
            }
            .pickerStyle(.wheel)
            .foregroundColor(.blue)
            Button(action: addUsage) {
                Text("Used")
            }
            .background(.blue)
            Spacer()
        }
    }
    
    private func addUsage() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

