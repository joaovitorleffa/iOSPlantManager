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
    private lazy var selectedEnvironment: PlantEnvironment? = environments.first
    private let API: APIProtocol
    
    var environments: [PlantEnvironment] = PlantEnvironment.mock()
    var plants: [Plant] = []
    
    init(view: PlantsViewProtocol, API: APIProtocol = Requester(), userManager: UserManagerProtocol = UserManager()) {
        self.userManager = userManager
        self.view = view
        self.API = API
    }
}

extension PlantsPrensenter: PlantsPresenterProtocol {
    func fetchEnvironmentsData() {
        
    }
    
    func fetchPlants() {
        API.request(.plants) { [weak self] (result: Result<[Plant], APIError>) in
            switch result {
            case .success(let data):
                self?.plants = data
                self?.view?.reloadData()
            case .failure(let error):
                print(error)
            }
        }
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
