//
//  CoreDataTestStack.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import Foundation
import CoreData

class CoreDataTestStack {
    
    let persistentContainer: NSPersistentContainer
    let mainContext: NSManagedObjectContext
    
    init() {
        persistentContainer = NSPersistentContainer(name: "iOSPlantManager")
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.type = NSInMemoryStoreType
        
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("Não foi possível carregar a store \(error!)")
            }
        }
        
        mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainContext.automaticallyMergesChangesFromParent = true
        mainContext.persistentStoreCoordinator = persistentContainer.persistentStoreCoordinator
    }
}
