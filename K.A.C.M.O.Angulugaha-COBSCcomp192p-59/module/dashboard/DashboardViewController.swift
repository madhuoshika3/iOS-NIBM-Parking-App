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
        let tabBarItem1 = UITabBarItem(title: "Home", image: UIImage(named: "home_icon_gray"), selectedImage:  UIImage(named: "home_icon_blue"))
        tabBarItem1.tag = 0
        vc1.tabBarItem = tabBarItem1

        let vc2 = appCoordinator.loadSignIn()
        vc2.view.backgroundColor = UIColor.white
        let tabBarItem2 = UITabBarItem(title: "Sign In", image: UIImage(named: "sign_in_gray"), selectedImage:  UIImage(named: "sign_in_blue"))
        tabBarItem2.tag = 1
        vc2.tabBarItem = tabBarItem2
        
        let vc3 = appCoordinator.loadBooking()
        vc3.view.backgroundColor = UIColor.white
        let tabBarItem3 = UITabBarItem(title: "Booking", image: UIImage(named: "booking_gray"), selectedImage:  UIImage(named: "booking_blue"))
        tabBarItem3.tag = 2
        vc3.tabBarItem = tabBarItem3

        viewControllers = [vc1, vc2, vc3]
    }

    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarIndex = tabBarController.selectedIndex
        
    }
}
