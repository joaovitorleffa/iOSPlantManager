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
    func navigateToConfimation()
}

class UserIdentificationViewController: BaseViewController<UserIdentificationView> {
    
    lazy var presenter: UserIdentificationPresenterProtocol = UserIdentificationPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        customView.nameTextField.addTarget(self, action: #selector(onChangeText), for: .editingChanged)
        customView.confirmButton.addTarget(self, action: #selector(onSave), for: .touchUpInside)
    }
    
    @objc
    func onChangeText() {
        if let text = customView.nameTextField.text {
            presenter.onChangeName(text: text)
        }
    }
    
    @objc
    func onSave() {
        presenter.saveName()
    }
}

extension UserIdentificationViewController: ConfirmationViewDelegate {
    func onTapButton() {
        navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}

extension UserIdentificationViewController: UserIdentificationViewProtocol {
    func updateScreen(isFilled: Bool) {
        isFilled == true ? customView.confirmState() : customView.initialState()
    }
    
    func navigateToConfimation() {
        let vcModel = ConfirmationViewModel(emoji: "😁",
                                            title: "Prontinho",
                                            message: "Agora vamos começar a cuidar das suas plantinhas com muito cuidado.",
                                            buttonText: "Começar")
        let vc = ConfirmationViewController(vcModel)
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
