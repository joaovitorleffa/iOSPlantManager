//
//  Welcome.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import UIKit

class GreetingViewController: BaseViewController<GreetingView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.nextButton.addTarget(self, action: #selector(onTapNextButton), for: .touchUpInside)
    }
    
    @objc
    private func onTapNextButton() {
        navigationController?.pushViewController(UserIdentificationViewController(), animated: true)
    }
}

