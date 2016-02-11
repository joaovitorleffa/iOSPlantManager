//
//  AddPlantView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class AddPlantView: UIView {
    let containerStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let headingStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 24
        return $0
    }(UIStackView())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .title
        $0.textAlignment = .center
        $0.textColor = .heading
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .headingLarge
        $0.textColor = .body
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    let waterTipsCard: WaterTipsCard = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(WaterTipsCard())
    
    let timerWrapperStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 12
        return $0
    }(UIStackView())
    
    let timerInfoLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .headingSmall
        $0.textColor = .body
        $0.textAlignment = .center
        $0.text = "Escolha o melhor horário para ser lembrado:"
        return $0
    }(UILabel())
    
    let timePicker: UIDatePicker = {
        $0.datePickerMode = .countDownTimer
        return $0
    }(UIDatePicker())
    
    let addButton: ButtonPrimary = {
        $0.configure(with: .init(text: "Cadastrar Planta"))
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
    
    func configure(name: String, description: String, imageUrl: String, waterTips: String) {
        titleLabel.text = name
        descriptionLabel.text = description
        imageView.loadImage(from: imageUrl)
        waterTipsCard.configure(with: .init(text: waterTips))
    }
}

extension AddPlantView: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(headingStackView)
        containerStackView.addArrangedSubview(waterTipsCard)
        containerStackView.addArrangedSubview(timerWrapperStackView)
        containerStackView.addArrangedSubview(addButton)
        
        headingStackView.addArrangedSubview(titleLabel)
        headingStackView.addArrangedSubview(descriptionLabel)
        timerWrapperStackView.addArrangedSubview(timerInfoLabel)
        timerWrapperStackView.addArrangedSubview(timePicker)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            timePicker.heightAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 176)
        ])
    }
    
    
}
