//
//  ConfirmationViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

class ConfirmationViewController: BaseViewController<ConfirmationView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.startButton.addTarget(self, action: #selector(onTapStart), for: .touchUpInside)
    }
    
    @objc
    func onTapStart() {
        navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}
