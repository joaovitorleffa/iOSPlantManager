//
//  ConfirmationViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

protocol ConfirmationViewDelegate: AnyObject {
    func onTapButton()
}

class ConfirmationViewController: BaseViewController<ConfirmationView> {
    weak var delegate: ConfirmationViewDelegate?
    
    init(_ model: ConfirmationViewModel) {
        super.init()
        self.customView.configure(width: model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        customView.startButton.addTarget(self, action: #selector(onTapStart), for: .touchUpInside)
    }
    
    @objc
    func onTapStart() {
        delegate?.onTapButton()
    }
}
