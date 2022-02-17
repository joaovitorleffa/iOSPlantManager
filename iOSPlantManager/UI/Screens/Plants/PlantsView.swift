//
//  PlantsView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class PlantsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PlantsView: ViewCode {
    func buildViewHierarchy() {
    
    }
    
    func setupConstraints() {
    
    }
}
