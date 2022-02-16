//
//  UserManager.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import Foundation
import CoreData

protocol UserManagerProtocol: AnyObject {
    @discardableResult func createUser(name: String, profileImageUrl: String) -> User?
    func fetchUser() -> User?
}

class UserManager {
    let mainContext: NSManagedObjectContext
    
    init(mainContext: NSManagedObjectContext = CoreDataManager.shared.mainContext) {
        self.mainContext = mainContext
    }
}

extension UserManager: UserManagerProtocol {
    @discardableResult
    func createUser(name: String, profileImageUrl: String) -> User? {
        let user = User(context: mainContext)
        
        user.name = name
        user.profileImageUrl = profileImageUrl
        
        do {
            try mainContext.save()
            return user
        } catch {
            print("Falha ao criar usuário \(error)")
        }
        
        return nil
    }
    
    func fetchUser() -> User? {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let user = try mainContext.fetch(fetchRequest).first
            return user
        } catch {
            print("Falha ao buscar usuário \(error)")
        }
        
        return nil
    }
}
