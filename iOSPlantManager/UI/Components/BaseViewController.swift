//
//  BaseViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import Foundation
import UIKit

class BaseViewController<View>: UIViewController where View: ViewCode {
    var customView: View = .init()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
}
