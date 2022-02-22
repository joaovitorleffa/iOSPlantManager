//
//  MyPlantsPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import Foundation

protocol MyPlantsPresenterProtocol: AnyObject {
    func loadData()
    func deletePlant(plant: Plant)
    func numberOfRowsInSection() -> Int
    func plantModel(indexPath: IndexPath) -> (String, String, String)
}

class MyPlantsPresenter {
    private let plantManager: MyPlantManagerProtocol
    private weak var view: MyPlantsViewProtocol?
    
    var plants: [MyPlant] = []
    
    init(view: MyPlantsViewProtocol, plantManager: MyPlantManagerProtocol = MyPlantManager()) {
        self.view = view
        self.plantManager = plantManager
    }
}

extension MyPlantsPresenter: MyPlantsPresenterProtocol {
    func loadData() {
        if let myPlants = plantManager.fetchMyPlants() {
            plants = myPlants
            view?.reloadTable()
        }
    }
    
    func deletePlant(plant: Plant) {
        // TODO: Deletar planta
    }
    
    func numberOfRowsInSection() -> Int {
        plants.count
    }
    
    func plantModel(indexPath: IndexPath) -> (String, String, String) {
        let plant = plants[indexPath.row]
        return (plant.photo ?? "", plant.name ?? "", plant.dateTimeNotification?.formatHHmm ?? "")
    }
}
