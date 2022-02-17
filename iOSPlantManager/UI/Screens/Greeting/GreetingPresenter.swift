//
//  GreetingPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

protocol GreetingPresenterProtocol: AnyObject {
    func hasUserData() -> Bool
}

class GreetingPresenter {
    private var userManager: UserManagerProtocol
    
    init(userManager: UserManagerProtocol = UserManager()) {
        self.userManager = userManager
    }
}

extension GreetingPresenter: GreetingPresenterProtocol {
    func hasUserData() -> Bool {
        userManager.fetchUser() != nil
    }
}
