//
//  UserIdentificationViewMock.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 16/02/22.
//

import Foundation
@testable import iOSPlantManager

class UserIdentificationViewMock {
    private(set) var navigationToConfirmationCalled = false
    private(set) var updateScreenCalledWith: Bool?
}

extension UserIdentificationViewMock: UserIdentificationViewProtocol {
    func navigateToConfimation() {
        navigationToConfirmationCalled = true
    }
    
    func updateScreen(isFilled: Bool) {
        updateScreenCalledWith = isFilled
    }
}
