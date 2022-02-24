//
//  GreetingViewMock.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import Foundation
@testable import iOSPlantManager

class GreetingViewMock {
    private(set) var navigateToTabIsCaled = false
}

extension GreetingViewMock: GreetingViewProtocol {
    func navigateToTab() {
        navigateToTabIsCaled = true
    }
}
