//
//  UserInfoCollectionViewCell.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class UserInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "UserInfoCollectionViewCell"
    
    let containerStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    let greetingLabel: UILabel = {
        $0.font = .titleLight
        $0.textColor = .heading
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 56 / 2
        $0.layer.masksToBounds = true
        $0.backgroundColor = .systemGray6
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, imageUrl: String) {
        greetingLabel.attributedText = NSAttributedString(string: "Olá,\n").appendWeight(name)
        
        if imageUrl.isEmpty {
            imageView.image = UIImage(systemName: "person.fill")
            imageView.contentMode = .center
            imageView.tintColor = .systemGray
        } else {
            imageView.loadImage(from: imageUrl)
        }
    }
}

extension UserInfoCollectionViewCell: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(greetingLabel)
        containerStackView.addArrangedSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 56),
            imageView.widthAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    
}
