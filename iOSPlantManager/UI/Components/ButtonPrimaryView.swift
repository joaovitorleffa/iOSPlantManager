//
//  ButtonPrimaryView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import UIKit

struct ButtonPrimaryViewModel {
    let text: String
}

class ButtonPrimaryView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonPrimaryView {
    func setupLayout() {
        backgroundColor = .green
        tintColor = .shape
        layer.cornerRadius = 16
        titleLabel?.font = .headingLargeSemiBold
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func configure(with model: ButtonPrimaryViewModel) {
        setTitle(model.text, for: .normal)
    }
}
