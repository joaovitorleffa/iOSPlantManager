//
//  PlantEnvironmentCollectionViewCell.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class PlantEnvironmentCollectionViewCell: UICollectionViewCell {
    static let indetifier = "PlantEnvironmentCollectionViewCell"
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, isSelected: Bool = true) {
        titleLabel.text = title
        isSelected ? selectedState() : defaultState()
    }
    
    func selectedState() {
        self.backgroundColor = .greenLight
        
        titleLabel.font = .headingSmallSemiBold
        titleLabel.textColor = .greenDark
    }
    
    func defaultState() {
        self.backgroundColor = .shape
        
        titleLabel.font = .headingSmall
        titleLabel.textColor = .body
    }
}

extension PlantEnvironmentCollectionViewCell: ViewCode {
    func buildViewHierarchy() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    
}
