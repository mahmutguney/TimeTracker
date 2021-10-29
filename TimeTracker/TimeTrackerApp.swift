//
//  TimeTrackerApp.swift
//  TimeTracker
//
//  Created by Mahmut Güney on 28.10.2021.
//

import SwiftUI

@main
struct TimeTrackerApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
