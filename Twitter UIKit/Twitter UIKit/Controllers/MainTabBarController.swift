//
//  ViewController.swift
//  Twitter UIKit
//
//  Created by Aurelio Le Clarke on 19.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    private func setupControllers() {
        
        let nav1 = UINavigationController(rootViewController: HomeViewController())
        let nav2 = UINavigationController(rootViewController: SearchViewController())
        let nav3 = UINavigationController(rootViewController: NotificationsViewController())
        let nav4 = UINavigationController(rootViewController: DirectMessagesViewController())
        
        nav1.tabBarItem.image = UIImage(systemName: "house")
        nav1.tabBarItem.image = UIImage(systemName: "house.fill")
        
        nav2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        nav3.tabBarItem.image = UIImage(systemName: "bell")
        nav3.tabBarItem.image = UIImage(systemName: "bell.fill")
        nav4.tabBarItem.image = UIImage(systemName: "envelope")
        nav4.tabBarItem.image = UIImage(systemName: "envelope.fill")
        
    setViewControllers([nav1,nav2,nav3,nav4], animated: true)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
 setupControllers()
    }


}

