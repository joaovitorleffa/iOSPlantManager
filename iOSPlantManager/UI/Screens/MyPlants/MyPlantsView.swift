//
//  MyPlantsView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class MyPlantsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPlantsView: ViewCode {
    func buildViewHierarchy() {
            
    }
    
    func setupConstraints() {
            
    }
}
