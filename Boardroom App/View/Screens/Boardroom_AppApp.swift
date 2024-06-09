//
//  Boardroom_AppApp.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 14/02/2024.
//

import SwiftUI
import SwiftData

@main
struct Boardroom_AppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
