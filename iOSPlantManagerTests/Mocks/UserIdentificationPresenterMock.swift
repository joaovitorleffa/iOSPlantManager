//
//  UserIdentificationPresenterMock.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import Foundation
@testable import iOSPlantManager

class UserIdentificationPresenterMock {
    private(set) var onChangeNameCalledWith: String?
    private(set) var saveNameCalled = false
}

extension UserIdentificationPresenterMock: UserIdentificationPresenterProtocol {
    func onChangeName(text: String) {
        onChangeNameCalledWith = text
    }
    
    func saveName() {
        saveNameCalled = true
    }
}
