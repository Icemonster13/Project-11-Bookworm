//
//  DataController.swift
//  Bookworm
//
//  Created by Michael & Diana Pascucci on 5/14/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    
    // MARK: - PROPERTIES
    let container = NSPersistentContainer(name: "Bookworm")
    
    // MARK: - INITIALIZERS
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
