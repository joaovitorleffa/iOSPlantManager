//
//  ButtonPrimaryView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import UIKit

struct ButtonPrimaryModel {
    let text: String
}

class ButtonPrimary: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ButtonPrimaryModel) {
        setTitle(model.text, for: .normal)
    }
    
    func setup() {
        backgroundColor = .green
        tintColor = .shape
        layer.cornerRadius = 16
        titleLabel?.font = .headingLargeSemiBold
    }
}

extension ButtonPrimary: ViewCode {
    func buildViewHierarchy() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
