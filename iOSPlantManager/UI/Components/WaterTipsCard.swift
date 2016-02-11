//
//  WaterTipsCard.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

struct WaterTipsCardModel {
    let text: String
}

class WaterTipsCard: UIView {
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "drop.fill")
        $0.tintColor = .blue
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .heading
        $0.textColor = .blue
        $0.numberOfLines = 3
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .blueLight
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
    func configure(with model: WaterTipsCardModel) {
        textLabel.text = model.text
    }
}


extension WaterTipsCard: ViewCode {
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(textLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 100),
            
            imageView.widthAnchor.constraint(equalToConstant: 46),
            imageView.heightAnchor.constraint(equalToConstant: 46),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            textLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 24),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
