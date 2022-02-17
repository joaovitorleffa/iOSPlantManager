//
//  ConfirmationView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class ConfirmantionView: UIView {
    let containerStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 40
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    let wrapperStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 12
        return $0
    }(UIStackView())
    
    let emojiLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 64)
        $0.textAlignment = .center
        $0.text = "😁"
        return $0
    }(UILabel())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .title
        $0.textColor = .heading
        $0.textAlignment = .center
        $0.text = "Prontinho"
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .headingLarge
        $0.textColor = .body
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "Agora vamos começar a cuidar das suas plantinhas com muito cuidado."
        return $0
    }(UILabel())
    
    let startButton: ButtonPrimaryView = {
        $0.configure(with: .init(text: "Começar"))
        return $0
    }(ButtonPrimaryView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ConfirmantionView: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(emojiLabel)
        containerStackView.addArrangedSubview(wrapperStackView)
        
        wrapperStackView.addArrangedSubview(titleLabel)
        wrapperStackView.addArrangedSubview(descriptionLabel)
        
        containerStackView.addArrangedSubview(startButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
