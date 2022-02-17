//
//  UserIdentificationViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import Foundation
import UIKit

protocol UserIdentificationViewProtocol: AnyObject {
    func updateScreen(isFilled: Bool)
}

class UserIdentificationViewController: BaseViewController<UserIdentificationView> {
    
    lazy var presenter: UserIdentificationPresenterProtocol = UserIdentificationPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        customView.nameTextField.addTarget(self, action: #selector(onChangeText), for: .editingChanged)
        customView.confirmButton.addTarget(self, action: #selector(onSave), for: .touchUpInside)
    }
    
    @objc
    private func onChangeText() {
        if let text = customView.nameTextField.text {
            presenter.onChangeName(text: text)
        }
    }
    
    @objc
    private func onSave() {
        presenter.saveName()
    }
}

extension UserIdentificationViewController: UserIdentificationViewProtocol {
    func updateScreen(isFilled: Bool) {
        if isFilled == true {
            customView.confirmState()
        } else {
            customView.initialState()
        }
    }
}
