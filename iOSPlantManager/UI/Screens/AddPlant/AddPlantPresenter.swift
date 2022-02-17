//
//  AddPlantPresenter.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import Foundation

protocol AddPlantPresenterProtocol: AnyObject {
    func addPlant(_ plant: Plant)
    func didChangeSelectedDate(_ date: Date)
}

class AddPlantPresenter {
    private var selectedDate: Date = Date()
    private var myPlantManager: MyPlantManagerProtocol
    private weak var view: AddPlantViewProtocol?
    
    init(view: AddPlantViewProtocol, myPlantManager: MyPlantManagerProtocol = MyPlantManager()) {
        self.view = view
        self.myPlantManager = myPlantManager
    }
}

extension AddPlantPresenter: AddPlantPresenterProtocol {
    func addPlant(_ plant: Plant) {
        let plant = myPlantManager.savePlant(id: plant.id, name: plant.name, photo: plant.photo, dateTimeNotification: selectedDate)
        if plant != nil {
            view?.saved()
        }
    }
    
    func didChangeSelectedDate(_ date: Date) {
        selectedDate = date
    }
}
