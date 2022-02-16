//
//  TextFieldPrimaryView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import UIKit

struct TextFieldPrimaryViewModel {
    let placeholder: String
}

class TextFieldPrimaryView: UITextField {
    let height: CGFloat = 56
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextFieldPrimaryView {
    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let bottomLine = CALayer()
        bottomLine.frame = .init(x: 0, y: height - 1, width: UIScreen.main.bounds.width - 144, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
        
        font = .headingLarge
        textColor = .body
        textAlignment = .center
        setupConstraints()
    }
    
    func configure(with model: TextFieldPrimaryViewModel) {
        placeholder = model.placeholder
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
