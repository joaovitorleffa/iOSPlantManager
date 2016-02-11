//
//  UserInfoCollectionViewCell.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class UserInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "UserInfoCollectionViewCell"
    
    let userInfoView: UserInfoView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UserInfoView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: UserInfoViewModel) {
        userInfoView.configure(with: model)
    }
}

extension UserInfoCollectionViewCell: ViewCode {
    func buildViewHierarchy() {
        addSubview(userInfoView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInfoView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
