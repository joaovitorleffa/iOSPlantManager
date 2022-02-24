//
//  UserIdentificationViewControllerTests.swift
//  iOSPlantManagerTests
//
//  Created by joaovitor on 24/02/22.
//

import XCTest
@testable import iOSPlantManager

class UserIdentificationViewControllerTests: XCTestCase {

    var presenter = UserIdentificationPresenterMock()
    var sut: UserIdentificationViewController!
    
    override func setUp() {
        sut = UserIdentificationViewController()
        sut.presenter = presenter
        sut.loadViewIfNeeded()
    }
    
    func test_onChangeName() {
        sut.viewDidLoad()
        sut.customView.nameTextField.setValue("Joao", forKey: "text")
        
        sut.onChangeText()
        
        XCTAssertEqual(presenter.onChangeNameCalledWith, "Joao")
    }
    
    func test_onSave() {
        sut.viewDidLoad()
        sut.customView.nameTextField.setValue("Joao", forKey: "text")
        sut.onChangeText()
        
        sut.onSave()
        XCTAssertTrue(presenter.saveNameCalled)
    }
    
    func test_updateScreen_confirmState() {
        sut.viewDidLoad()
        
        sut.updateScreen(isFilled: true)
        
        XCTAssertTrue(sut.customView.confirmButton.isEnabled)
        XCTAssertEqual(sut.customView.confirmButton.layer.opacity, 1)
        XCTAssertEqual(sut.customView.emojiLabel.text, "😄")
    }
    
    func test_updateScreen_initialState() {
        sut.viewDidLoad()
        
        sut.updateScreen(isFilled: false)
        
        XCTAssertFalse(sut.customView.confirmButton.isEnabled)
        XCTAssertEqual(sut.customView.confirmButton.layer.opacity, 0.6)
        XCTAssertEqual(sut.customView.emojiLabel.text, "😃")
    }
}
