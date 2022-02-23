//
//  AddPlantViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

protocol AddPlantViewProtocol: AnyObject {
    func saved()
    func invalidDate()
}

class AddPlantViewController: BaseViewController<AddPlantView> {
    private let plant: Plant
    lazy var presenter: AddPlantPresenterProtocol = AddPlantPresenter(view: self)
    
    init(plant: Plant) {
        self.plant = plant
        super.init()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarController?.tabBar.isHidden = true
        customView.configure(name: plant.name, description: plant.about, imageUrl: plant.photo, waterTips: plant.waterTips)
        customView.timePicker.addTarget(self, action: #selector(onChangeTime), for: .valueChanged)
        customView.addButton.addTarget(self, action: #selector(onSavePlant), for: .touchUpInside)
    }

    @objc
    func onChangeTime(sender: UIDatePicker) {
        presenter.didChangeSelectedDate(sender.date)
    }
    
    @objc
    func onSavePlant() {
        presenter.addPlant(plant)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddPlantViewController: AddPlantViewProtocol {
    func saved() {
        let vcModel = ConfirmationViewModel(
                            emoji: "🤗", title: "Tudo certo",
                            message: "Fique tranquilo que sempre vamos lembrar você de cuidar da sua platinha com bastante amor.",
                            buttonText: "Entendi")
        let vc = ConfirmationViewController(vcModel)
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func invalidDate() {
    
    }
}

extension AddPlantViewController: ConfirmationViewDelegate {
    func onTapButton() {
        tabBarController?.selectedIndex = 1
        navigationController?.popToRootViewController(animated: false)
    }
}
