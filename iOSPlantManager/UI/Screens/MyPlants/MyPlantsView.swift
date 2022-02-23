//
//  MyPlantsView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class MyPlantsView: UIView {
    let userInfoView: UserInfoView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.configure(with: .init(titlePrefix: "Minhas", title: "Plantinhas", imageUrl: ""))
        return $0
    }(UserInfoView())
    
    let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.bounces = false
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .background
        return $0
    }(UITableView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPlantsView: ViewCode {
    func buildViewHierarchy() {
        addSubview(userInfoView)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            userInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            userInfoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userInfoView.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
