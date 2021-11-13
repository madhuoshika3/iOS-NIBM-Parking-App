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
    }

    // UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarIndex = tabBarController.selectedIndex
        
        if tabBarIndex == 0 {
            
        } else if tabBarIndex == 1 {
            if let signInViewController = storyboard.instantiateViewController(withIdentifier: "signInVC") as? SignInViewController {
//                signInViewController.setupDelegates()
            }
        }
    }
}
