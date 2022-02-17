//
//  PlantsPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

protocol PlantsPresenterProtocol: AnyObject {
    func fetchEnvironmentsData()
    func fetchPlants()
    func userModel() -> User
    func environmentModel(indexPath: IndexPath) -> (environment: PlantEnvironment, isSelected: Bool)
    func plantModel(indexPath: IndexPath) -> Plant
    func numberOfItensInSection(section: Int) -> Int
    func didSelectItem(indexPath: IndexPath)
}

class PlantsPrensenter {
    private var userManager: UserManagerProtocol
    private weak var view: PlantsViewProtocol?
    private var environments: [PlantEnvironment] = PlantEnvironment.mock()
    private var plants: [Plant] = Plant.mock()
    private lazy var selectedEnvironment: PlantEnvironment? = environments.first
    
    init(view: PlantsViewProtocol, userManager: UserManagerProtocol = UserManager()) {
        self.userManager = userManager
        self.view = view
    }
}

extension PlantsPrensenter: PlantsPresenterProtocol {
    func fetchEnvironmentsData() {
        
    }
    
    func fetchPlants() {
        
    }
    
    func userModel() -> User {
        userManager.fetchUser()!
    }
    
    func environmentModel(indexPath: IndexPath) -> (environment: PlantEnvironment, isSelected: Bool) {
        let environment = environments[indexPath.row]
        let isSelected = selectedEnvironment != nil && environment.key == selectedEnvironment!.key
        return (environment: environment, isSelected: isSelected)
    }
    
    func plantModel(indexPath: IndexPath) -> Plant {
        plants[indexPath.row]
    }
    
    func numberOfItensInSection(section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        if section == 1 {
            return environments.count
        }
       
        return plants.count
       
    }
    
    func didSelectItem(indexPath: IndexPath) {
        if indexPath.section == 1 {
            selectedEnvironment = environmentModel(indexPath: indexPath).environment
            view?.reloadData()
        }
        
        if indexPath.section == 2 {
            view?.navigate(with: plants[indexPath.row])
        }
    }
}
