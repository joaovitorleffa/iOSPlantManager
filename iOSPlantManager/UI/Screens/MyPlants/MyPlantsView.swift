//
//  MyPlantsView.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit
import SnapKit

class MyPlantsView: UIView {
    let userInfoView: UserInfoView = {
        $0.configure(with: UserInfoViewDescriptor(titlePrefix: "Minhas", title: "Plantinhas", imageUrl: ""))
        return $0
    }(UserInfoView())
    
    let tableView: UITableView = {
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
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(32)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }
        tableView.snp.makeConstraints { make in
            make.leading.centerX.equalToSuperview()
            make.top.equalTo(userInfoView.snp.bottom)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
