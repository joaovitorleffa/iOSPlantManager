//
//  ViewCode.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import UIKit

protocol ViewCode: UIView {
    func buildViewHierarchy()
    func setupConstraints()
}

extension ViewCode {
    func setupLayout() {
        buildViewHierarchy()
        setupConstraints()
    }
}
