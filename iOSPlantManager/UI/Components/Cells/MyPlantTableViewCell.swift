//
//  MyPlantCollectionViewCell.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class MyPlantTableViewCell: UITableViewCell {
    static let identifier: String = String(describing: self)
    
    let containerStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        return $0
    }(UIStackView())
    
    let photoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .headingLargeSemiBold
        $0.textColor = .heading
        return $0
    }(UILabel())
    
    let timeWrapperStackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .trailing
        return $0
    }(UIStackView())
    
    let timeInfoLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Regue às"
        $0.textColor = .border
        $0.font = .headingSmall
        return $0
    }(UILabel())
    
    let timeLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .headingSmallSemiBold
        $0.textColor = .heading

        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .shape
        selectionStyle = .none
    }
    
    func configure(imageUrl: String, name: String, time: String) {
        photoImageView.loadImage(from: imageUrl)
        titleLabel.text = name
        timeLabel.text = time
    }
}

extension MyPlantTableViewCell: ViewCode {
    func buildViewHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(photoImageView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(timeWrapperStackView)
        
        timeWrapperStackView.addArrangedSubview(timeInfoLabel)
        timeWrapperStackView.addArrangedSubview(timeLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            containerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            photoImageView.widthAnchor.constraint(equalToConstant: 52),
            photoImageView.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    
}
