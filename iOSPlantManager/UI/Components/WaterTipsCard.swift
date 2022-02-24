//
//  WaterTipsCard.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit
import SnapKit

struct WaterTipsCardModel {
    let text: String
}

class WaterTipsCard: UIView {
    let imageView: UIImageView = {
        $0.image = UIImage(systemName: "drop.fill")
        $0.tintColor = .blue
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let textLabel: UILabel = {
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
        self.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(46)
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(24)
            make.center.equalToSuperview()
        }
    }
}
