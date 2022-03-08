//
//  MyPlantsViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

protocol MyPlantsViewProtocol: AnyObject {
    func reloadTable()
}

class MyPlantsViewController: BaseViewController<MyPlantsView> {
    lazy var presenter: MyPlantsPresenterProtocol = MyPlantsPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.register(MyPlantTableViewCell.self, forCellReuseIdentifier: MyPlantTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadData()
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
}

// MARK: - TableView Delegates
extension MyPlantsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MyPlantsSectionHeader()
        header.configure(with: MyPlantsSectionHeaderDescriptor(title: "Próximas regadas"))
        return header
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Remover") { action, view, completion in
            let plant = self.presenter.plantModel(indexPath: indexPath)
            let popUp = PopUpConfirmationViewController(
                imageUrl: plant.photo ?? "",
                message: NSAttributedString.formatDeleteMessage(message: "Deseja mesmo deletar sua ", plantName: plant.name ?? ""),
                id: Int(plant.id)
            )
            popUp.delegate = self
            
            self.present(popUp, animated: true, completion: nil)
            completion(true)
        }
        
        action.backgroundColor = .red
        
        let config = UISwipeActionsConfiguration(actions: [action])
        
        return config
    }
}

// MARK: - TableView Data source
extension MyPlantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyPlantTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? MyPlantTableViewCell {
            let plant = presenter.plantModel(indexPath: indexPath)
            cell.configure(imageUrl: plant.photo ?? "", name: plant.name ?? "", time: plant.dateTimeNotification?.formatHHmm ?? "")
        }
        
        return cell
    }
}

extension MyPlantsViewController: PopUpConfimationViewDelegate {
    func onDelete(id: Int) {
        presenter.deletePlant(id: id)
    }
}

extension MyPlantsViewController: MyPlantsViewProtocol {
    func reloadTable() {
        DispatchQueue.main.async {
            self.customView.tableView.reloadData()
        }
    }
}
