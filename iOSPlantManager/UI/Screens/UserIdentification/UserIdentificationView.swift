//
//  UserIdentificationView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 16/02/22.
//

import UIKit

class UserIdentificationView: ViewWithKeyboard {
    let containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    let contentStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 40
        return $0
    }(UIStackView())
    
    let emojiLabel: UILabel = {
        $0.font = .systemFont(ofSize: 42)
        $0.text = "😃"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let titleLabel: UILabel = {
        $0.font = .title
        $0.textColor = .heading
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "Como podemos chamar você?"
        return $0
    }(UILabel())
    
    let nameTextField: TextFieldPrimaryView = {
        $0.configure(with: .init(placeholder: "Digite o seu nome"))
        $0.returnKeyType = .send
        return $0
    }(TextFieldPrimaryView())
    
    let confirmButton: ButtonPrimaryView = {
        $0.isEnabled = false
        $0.layer.opacity = 0.6
        $0.configure(with: .init(text: "Confirmar"))
        return $0
    }(ButtonPrimaryView())
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tap)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - view states
extension UserIdentificationView {
    func initialState() {
        confirmButton.isEnabled = false
        confirmButton.layer.opacity = 0.6
        emojiLabel.text = "😃"
    }
    
    func confirmState() {
        confirmButton.isEnabled = true
        confirmButton.layer.opacity = 1
        emojiLabel.text = "😄"
    }
}

// MARK: - ViewCode
extension UserIdentificationView: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(emojiLabel)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(nameTextField)
        contentStackView.addArrangedSubview(confirmButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor),
        
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 72),
            contentStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
        ])
    }
}
