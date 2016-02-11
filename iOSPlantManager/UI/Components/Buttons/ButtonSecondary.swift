//
//  ButtonSecondary.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import UIKit

struct ButtonSecondaryModel {
    let text: String
    let variant: Variant

    enum Variant {
        case normal
        case danger
    }
}

class ButtonSecondary: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .shape
        layer.cornerRadius = 12
        layer.masksToBounds = true
        titleLabel?.font = .heading
    }
    
    func configure(with model: ButtonSecondaryModel) {
        setTitle(model.text, for: .normal)
        setTitleColor(getColorBased(on: model.variant), for: .normal)
    }
    
    private func getColorBased(on variant: ButtonSecondaryModel.Variant) -> UIColor? {
        switch variant {
        case .normal:
            return UIColor.heading
        case .danger:
            return UIColor.red
        }
    }
}

extension ButtonSecondary: ViewCode {
    func buildViewHierarchy() {}
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
