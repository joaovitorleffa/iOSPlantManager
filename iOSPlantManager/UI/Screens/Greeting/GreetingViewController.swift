//
//  Welcome.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import UIKit

protocol GreetingViewProtocol: AnyObject {
    func navigateToTab()
}

class GreetingViewController: BaseViewController<GreetingView> {
    lazy var presenter: GreetingPresenterProtocol = GreetingPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoaded()
        setupNavigationController()
        
        customView.nextButton.addTarget(self, action: #selector(onTapNextButton), for: .touchUpInside)
    }
    
    func setupNavigationController() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc
    func onTapNextButton() {
        navigationController?.pushViewController(UserIdentificationViewController(), animated: true)
    }
}

extension GreetingViewController: GreetingViewProtocol {
    func navigateToTab() {
        navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}

