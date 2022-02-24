//
//  UserIdentificationPresenter.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 16/02/22.
//

import XCTest
@testable import iOSPlantManager

class UserIdentificationPresenterTests: XCTestCase {

    var userManager: UserManager!
    var coreDataStack: CoreDataTestStack!
    var sut: UserIdentificationPresenter!
    var view = UserIdentificationViewMock()
    
    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        userManager = UserManager(mainContext: coreDataStack.mainContext)
        sut = UserIdentificationPresenter(view: view, userManager: userManager)
    }
    
    func test_saveName() {
        sut.onChangeName(text: "João")
        sut.saveName()
        
        let user = userManager.fetchUser()
        
        XCTAssertEqual("João", user?.name)
        XCTAssertTrue(view.navigationToConfirmationCalled)
    }

    func test_onChangeNameWithInvalidName() {
        sut.onChangeName(text: "João")
        
        XCTAssertEqual(sut.name, "João")
        XCTAssertEqual(view.updateScreenCalledWith, false)
    }
    
    func test_onChangeNameWithValidName() {
        sut.onChangeName(text: "João Vitor")
        
        XCTAssertEqual(sut.name, "João Vitor")
        XCTAssertEqual(view.updateScreenCalledWith, true)
    }
}
