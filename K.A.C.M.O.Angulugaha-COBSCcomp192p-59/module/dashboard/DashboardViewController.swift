//
//  DashboardViewController.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

class DashboardViewController: UITabBarController, UITabBarControllerDelegate, Coordinated {
    
    var viewModel               : DashboardViewModel?
    var coordinationDelegate    : CoordinationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let appCoordinator = AppCoordinator(window: UIApplication.shared.keyWindow!)
        
        let vc1 = appCoordinator.loadHome()
        vc1.view.backgroundColor = UIColor.white
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)

        let vc2 = appCoordinator.loadSignIn()
        vc2.view.backgroundColor = UIColor.white
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let vc3 = appCoordinator.loadBooking()
        vc3.view.backgroundColor = UIColor.white
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)

        viewControllers = [vc1, vc2, vc3]
    }

    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarIndex = tabBarController.selectedIndex
        
    }
}
