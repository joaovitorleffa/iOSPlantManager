//
//  ButtonSecondary.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import UIKit

protocol ButtonSecondaryDescriptorProtocol {
    var text: String { get }
}

struct ButtonSecondaryDescriptor: ButtonSecondaryDescriptorProtocol {
    let text: String
    var variant: Variant
}

extension ButtonSecondaryDescriptor {
    enum Variant {
        case normal
        case danger
        
        var color: UIColor? {
            switch self {
            case .normal:
                return .heading
            case .danger:
                return .red
            }
        }
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
    
    func configure(with model: ButtonSecondaryDescriptor) {
        setTitle(model.text, for: .normal)
        setTitleColor(model.variant.color, for: .normal)
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
