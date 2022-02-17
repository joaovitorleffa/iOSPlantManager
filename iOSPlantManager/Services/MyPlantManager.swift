//
//  MyPlantManager.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation
import CoreData

protocol MyPlantManagerProtocol: AnyObject {
    @discardableResult func savePlant(id: Int, name: String, photo: String, dateTimeNotification: Date) -> MyPlant?
    func fetchMyPlants() -> [MyPlant]?
}

class MyPlantManager {
    let mainContext: NSManagedObjectContext
    
    init(mainContext: NSManagedObjectContext = CoreDataManager.shared.mainContext) {
        self.mainContext = mainContext
    }
}

extension MyPlantManager: MyPlantManagerProtocol {
    @discardableResult
    func savePlant(id: Int, name: String, photo: String, dateTimeNotification: Date) -> MyPlant? {
        let plant = MyPlant(context: mainContext)
        
        plant.id = Int64(id)
        plant.name = name
        plant.photo = photo
        plant.dateTimeNotification = dateTimeNotification
    
        do {
            try mainContext.save()
            return plant
        } catch {
            print("Falha ao salvar planta \(error)")
        }
        
        return nil
    }
    
    func fetchMyPlants() -> [MyPlant]? {
        let fetchRequest = NSFetchRequest<MyPlant>(entityName: "MyPlant")
        
        do {
            let plants = try mainContext.fetch(fetchRequest)
            return plants
        } catch {
            print("Falha ao buscar plantas \(error)")
        }
        
        return nil
    }
}
