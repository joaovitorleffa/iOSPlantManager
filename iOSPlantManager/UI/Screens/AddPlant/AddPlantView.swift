//
//  AddPlantView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit
import SnapKit

protocol AddPlantViewDescriptorProtocol {
    var name: String { get }
    var description: String { get }
    var imageUrl: String { get }
    var waterTips: String { get }
}

struct AddPlantViewDescriptor: AddPlantViewDescriptorProtocol {
    var name: String
    var description: String
    var imageUrl: String
    var waterTips: String
}

class AddPlantView: UIView {
    let containerStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let headingStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 24
        return $0
    }(UIStackView())
    
    let titleLabel: UILabel = {
        $0.font = .title
        $0.textAlignment = .center
        $0.textColor = .heading
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    let descriptionLabel: UILabel = {
        $0.font = .headingLarge
        $0.textColor = .body
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    let waterTipsCard: WaterTipsCard = {
        return $0
    }(WaterTipsCard())
    
    let timerWrapperStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 12
        return $0
    }(UIStackView())
    
    let timerInfoLabel: UILabel = {
        $0.font = .headingSmall
        $0.textColor = .body
        $0.textAlignment = .center
        $0.text = strings.addPlantViewTimerTitle()
        return $0
    }(UILabel())
    
    let timePicker: UIDatePicker = {
        $0.datePickerMode = .countDownTimer
        $0.minuteInterval = 15
        $0.timeZone = TimeZone(secondsFromGMT: 0)
        return $0
    }(UIDatePicker())
    
    let addButton: ButtonPrimary = {
        $0.configure(with: ButtonPrimaryDescriptor(text: strings.addPlantViewRegisterPlant()))
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
    
    func configure(with model: AddPlantViewDescriptorProtocol) {
        titleLabel.text = model.name
        descriptionLabel.text = model.description
        imageView.loadImage(from: model.imageUrl)
        waterTipsCard.configure(with: WaterTipsCardDescriptor(text: model.waterTips))
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
        containerStackView.snp.makeConstraints { make in
            make.top.centerY.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
        }
        timePicker.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(176)
        }
    }
}
