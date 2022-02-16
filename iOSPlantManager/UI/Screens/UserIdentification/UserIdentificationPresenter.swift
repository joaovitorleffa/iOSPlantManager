//
//  UserIdentificationPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import Foundation

protocol UserIdentificationPresenterProtocol: AnyObject {
    func onChangeName(text: String)
    func saveName()
}

class UserIdentificationPresenter {
    private var userManager: UserManagerProtocol
    private weak var view: UserIdentificationViewProtocol?
    
    private var name: String = ""
    
    init(view: UserIdentificationViewProtocol, userManager: UserManagerProtocol = UserManager()) {
        self.view = view
        self.userManager = userManager
    }
}

extension UserIdentificationPresenter: UserIdentificationPresenterProtocol {
    func onChangeName(text: String) {
        name = text
        view?.updateScreen(isFilled: name.count >= 5)
    }
    
    func saveName() {
        userManager.createUser(name: name, profileImageUrl: "")
    }
}
