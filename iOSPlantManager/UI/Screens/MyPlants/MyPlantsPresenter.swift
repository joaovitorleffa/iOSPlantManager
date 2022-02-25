//
//  MyPlantsPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 11/02/16.
//

import Foundation

protocol MyPlantsPresenterProtocol: AnyObject {
    func loadData()
    func deletePlant(id: Int)
    func numberOfRowsInSection() -> Int
    func plantModel(indexPath: IndexPath) -> MyPlant
}

class MyPlantsPresenter {
    private let plantManager: MyPlantManagerProtocol
    private weak var view: MyPlantsViewProtocol?
    
    var plants: [MyPlant] = [] {
        didSet {
            view?.reloadTable()
        }
    }
    
    init(view: MyPlantsViewProtocol, plantManager: MyPlantManagerProtocol = MyPlantManager()) {
        self.view = view
        self.plantManager = plantManager
    }
}

extension MyPlantsPresenter: MyPlantsPresenterProtocol {
    func loadData() {
        if let myPlants = plantManager.fetchMyPlants() {
            plants = myPlants.sorted { $0.dateTimeNotification!.compare($1.dateTimeNotification!) == .orderedAscending }
        }
    }
    
    func deletePlant(id: Int) {
        if let plant = plants.first(where: { $0.id == id }) {
            let isSuccess = plantManager.deleteMyPlant(plant: plant)
            if isSuccess == true {
                self.loadData()
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        plants.count
    }
    
    func plantModel(indexPath: IndexPath) -> MyPlant {
       plants[indexPath.row]
    }
}
