//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Michael & Diana Pascucci on 5/14/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    // MARK: - PROPERTIES
    // Creates a dataController at the root of our project
    @StateObject private var dataController = DataController()
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
