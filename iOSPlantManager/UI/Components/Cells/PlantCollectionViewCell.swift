//
//  PlantCollectionViewCell.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class PlantCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlantCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlantCollectionViewCell: ViewCode {
    func buildViewHierarchy() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = .shape
    }
    
    func setupConstraints() {
            
    }
}
