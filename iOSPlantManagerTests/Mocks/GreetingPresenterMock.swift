//
//  GreetingPresenter.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import Foundation
@testable import iOSPlantManager

class GreetingPresenterMock {
    private(set) var viewDidLoadedCalled = false
}

extension GreetingPresenterMock: GreetingPresenterProtocol {
    func viewDidLoaded() {
        viewDidLoadedCalled = true
    }
}
