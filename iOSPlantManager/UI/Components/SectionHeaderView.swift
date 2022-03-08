//
//  SectionHeader.swift
//  iOSPlantManager
//
//  Created by joaovitor on 23/02/22.
//

import UIKit

protocol SectionHeaderDescriptorProtocol {
    var text: NSAttributedString { get }
}

struct SectionHeaderDescriptor: SectionHeaderDescriptorProtocol {
    var text: NSAttributedString
}

class SectionHeaderView: UICollectionReusableView {
    static let identifier: String = String(describing: self)
    
    let label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .headingLarge
        $0.textColor = .heading
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SectionHeaderDescriptorProtocol) {
        label.attributedText = model.text
    }
}

extension SectionHeaderView: ViewCode {
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {}
}
