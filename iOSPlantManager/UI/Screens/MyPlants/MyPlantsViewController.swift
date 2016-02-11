//
//  MyPlantsViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class MyPlantsViewController: BaseViewController<MyPlantsView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarController?.tabBar.isHidden = false
    
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        
        customView.tableView.register(MyPlantTableViewCell.self, forCellReuseIdentifier: MyPlantTableViewCell.identifier)
    }
}

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
        header.configure(title: "Próximas regadas")
        return header
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Remover") { action, view, completion in
            // TODO: remover planta
            completion(true)
        }
        
        action.backgroundColor = .red
        
        let config = UISwipeActionsConfiguration(actions: [action])
        
        return config
    }
}

extension MyPlantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyPlantTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? MyPlantTableViewCell {
            cell.configure(imageUrl: "", name: "Peperomia", time: "07:30")
        }
        
        return cell
    }
    
    
}
