//
//  MyPlantsSectionHeader.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit
import SnapKit

protocol MyPlantsSectionHeaderDescriptorProtocol {
    var title: String { get }
}

struct MyPlantsSectionHeaderDescriptor: MyPlantsSectionHeaderDescriptorProtocol {
    var title: String
}

class MyPlantsSectionHeader: UIView {
    let titleLabel: UILabel = {
        $0.font = .titleLarge
        $0.textColor = .heading
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
    
    func configure(with model: MyPlantsSectionHeaderDescriptorProtocol) {
        titleLabel.text = model.title
    }
    
    func setup() {
        backgroundColor = .background
    }
}

extension MyPlantsSectionHeader: ViewCode {
    func buildViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.top.centerY.equalToSuperview()
        }
    }
}
