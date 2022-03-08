//
//  ConfirmationView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit
import SnapKit

protocol ConfirmationViewDescriptorProtocol {
    var emoji: String { get }
    var title: String { get }
    var message: String { get }
    var buttonText: String { get }
}


struct ConfirmationViewModel: ConfirmationViewDescriptorProtocol {
    var emoji: String
    var title: String
    var message: String
    var buttonText: String
}

class ConfirmationView: UIView {
    let containerStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 40
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    let wrapperStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 12
        return $0
    }(UIStackView())
    
    let emojiLabel: UILabel = {
        $0.font = .systemFont(ofSize: 64)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let titleLabel: UILabel = {
        $0.font = .title
        $0.textColor = .heading
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.font = .headingLarge
        $0.textColor = .body
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let startButton: ButtonPrimary = {
        return $0
    }(ButtonPrimary())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(width model: ConfirmationViewDescriptorProtocol) {
        emojiLabel.text = model.emoji
        titleLabel.text = model.title
        descriptionLabel.text = model.message
        startButton.configure(with: ButtonPrimaryDescriptor(text: model.buttonText))
    }
}

extension ConfirmationView: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(emojiLabel)
        containerStackView.addArrangedSubview(wrapperStackView)
        
        wrapperStackView.addArrangedSubview(titleLabel)
        wrapperStackView.addArrangedSubview(descriptionLabel)
        
        containerStackView.addArrangedSubview(startButton)
    }
    
    func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
        }
    }
}
