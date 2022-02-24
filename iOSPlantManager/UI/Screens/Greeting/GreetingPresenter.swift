//
//  GreetingPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

protocol GreetingPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class GreetingPresenter {
    private var userManager: UserManagerProtocol
    private weak var view: GreetingViewProtocol?
    
    init(view: GreetingViewProtocol, userManager: UserManagerProtocol = UserManager()) {
        self.userManager = userManager
        self.view = view
    }
}

extension GreetingPresenter: GreetingPresenterProtocol {
    func viewDidLoaded() {
        if userManager.fetchUser() != nil { view?.navigateToTab()  }
    }
}
