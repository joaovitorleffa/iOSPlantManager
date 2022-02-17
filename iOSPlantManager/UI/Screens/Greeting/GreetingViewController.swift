//
//  Welcome.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import UIKit

class GreetingViewController: BaseViewController<GreetingView> {
    var presenter: GreetingPresenterProtocol = GreetingPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        handleNavigation()
        customView.nextButton.addTarget(self, action: #selector(onTapNextButton), for: .touchUpInside)
    }
    
    @objc
    private func onTapNextButton() {
        navigationController?.pushViewController(UserIdentificationViewController(), animated: true)
    }
    
    private func handleNavigation() {
        if presenter.hasUserData() {
            navigationController?.pushViewController(TabBarViewController(), animated: false)
        }
    }
}

