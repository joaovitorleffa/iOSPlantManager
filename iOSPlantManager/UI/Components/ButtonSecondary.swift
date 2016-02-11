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
        
        backgroundColor = .shape
        layer.cornerRadius = 12
        layer.masksToBounds = true
        titleLabel?.font = .heading
    
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: ButtonSecondaryModel) {
        setTitle(model.text, for: .normal)
        let color: UIColor? = model.variant == .normal ? .heading : .red
        setTitleColor(color, for: .normal)
       
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
