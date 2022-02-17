//
//  PlantCollectionViewCell.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class PlantCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlantCollectionViewCell"
    
    let containerStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .title
        $0.textColor = .heading
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageUrl: String, name: String) {
        imageView.loadImage(from: imageUrl)
        titleLabel.text = name
    }
    
    private func setupView() {
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = .shape
    }
}

extension PlantCollectionViewCell: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
