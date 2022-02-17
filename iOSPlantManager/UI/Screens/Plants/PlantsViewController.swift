//
//  PlantsViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//"

import Foundation
import UIKit

protocol PlantsViewProtocol: AnyObject {
    func receiveUser(user: User)
    func reloadData()
}

class PlantsViewController: BaseViewController<PlantsView> {
    lazy var presenter: PlantsPresenterProtocol = PlantsPrensenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        customView.collectionView.register(UserInfoCollectionViewCell.self, forCellWithReuseIdentifier: UserInfoCollectionViewCell.identifier)
        customView.collectionView.register(PlantEnvironmentCollectionViewCell.self, forCellWithReuseIdentifier: PlantEnvironmentCollectionViewCell.indetifier)
    }
}

// MARK: - CollectionView delegates
extension PlantsViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(indexPath: indexPath)
    }
}

// MARK: - CollectionView data source
extension PlantsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItensInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserInfoCollectionViewCell.identifier, for: indexPath) as? UserInfoCollectionViewCell {
                let user = presenter.userModel()
                cell.configure(name: user.name ?? "", imageUrl: user.profileImageUrl ?? "")
                return cell
            }
        }
        
        if indexPath.section == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantEnvironmentCollectionViewCell.indetifier, for: indexPath) as? PlantEnvironmentCollectionViewCell {
                let (environment, isSelected) = presenter.environmentModel(indexPath: indexPath)
                cell.configure(title: environment.title, isSelected: isSelected)
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    
}

// MARK: - Protocol implementation
extension PlantsViewController: PlantsViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.customView.collectionView.reloadData()
        }
    }
    
    func receiveUser(user: User) {

    }
}
