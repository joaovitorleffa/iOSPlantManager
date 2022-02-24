//
//  PlantsViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//"

import Foundation
import UIKit

protocol PlantsViewProtocol: AnyObject {
    func reloadData()
    func navigate(with plant: Plant)
}

class PlantsViewController: BaseViewController<PlantsView> {
    lazy var presenter: PlantsPresenterProtocol = PlantsPrensenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoaded()
        
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        
        customView.collectionView.register(UserInfoCollectionViewCell.self, forCellWithReuseIdentifier: UserInfoCollectionViewCell.identifier)
        customView.collectionView.register(PlantEnvironmentCollectionViewCell.self, forCellWithReuseIdentifier: PlantEnvironmentCollectionViewCell.indetifier)
        customView.collectionView.register(PlantCollectionViewCell.self, forCellWithReuseIdentifier: PlantCollectionViewCell.identifier)
        
        customView.collectionView.register(SectionHeaderView.self,
                                           forSupplementaryViewOfKind: ElementKind.sectionHeader,
                                           withReuseIdentifier: SectionHeaderView.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .border
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - CollectionView delegates
extension PlantsViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == ElementKind.sectionHeader, indexPath.section == 1 {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as? SectionHeaderView {
                headerView.configure(with: .init(text: NSMutableAttributedString.formatSectionHeaderTitle(prefix: "Em qual ambiente",
                                                                                                          sufix: "você quer colocar a sua planta")))
                return headerView
            }
            
        }
        return UICollectionReusableView()
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
                cell.configure(with: .init(titlePrefix: "Olá", title: user.name ?? "", imageUrl: user.profileImageUrl ?? ""))
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
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlantCollectionViewCell.identifier, for: indexPath) as? PlantCollectionViewCell {
            let plant = presenter.plantModel(indexPath: indexPath)
            cell.configure(imageUrl: plant.photo, name: plant.name)
            return cell
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
    
    func navigate(with plant: Plant) {
        navigationController?.pushViewController(AddPlantViewController(plant: plant), animated: true)
    }
}
