//
//  CoreDataManager.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    let mainContext: NSManagedObjectContext
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "iOSPlantManager")
        let description = persistentContainer.persistentStoreDescriptions.first
        description?.type = NSSQLiteStoreType
        
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("Não foi possível carregar a store \(error!)")
            }
        }
        
        mainContext = persistentContainer.viewContext
    }
}
