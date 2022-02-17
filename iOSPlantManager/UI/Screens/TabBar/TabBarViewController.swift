//
//  TabBarViewController.swift
//  iOSPlantManager
//
//  Created by joaovitor on 17/02/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
    }
    
    func setupTabBar() {
        let plantsTab = UINavigationController(rootViewController: PlantsViewController())
        let myPlantsTab = UINavigationController(rootViewController: MyPlantsViewController())
        
        let plantsTabBarItem = UITabBarItem(title: "Nova Planta", image: UIImage(systemName: "plus.circle"), tag: 1)
        let myPlantsTabBarItem = UITabBarItem(title: "Minhas Plantas", image: UIImage(systemName: "list.bullet"), tag: 2)
        
        tabBar.layer.borderColor = UIColor.border?.cgColor
        tabBar.layer.borderWidth = 0.5
        tabBar.tintColor = .green
        
        plantsTab.tabBarItem = plantsTabBarItem
        myPlantsTab.tabBarItem = myPlantsTabBarItem
        
        viewControllers = [plantsTab, myPlantsTab]
    }
}
