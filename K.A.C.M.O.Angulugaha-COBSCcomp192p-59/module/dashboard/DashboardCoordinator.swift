//
//  DashboardCoordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

protocol DashboardCoordinatorDelegate: HandleSegueDelegate {
    
}

class DashboardCoordinator: Coordinator {
    
    var window          : UIWindow
    weak var delegate   : DashboardCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as? DashboardViewController {
            var viewModel =  DashboardViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            let nav = UINavigationController.init(rootViewController: vc)
            window.rootViewController = nav
        }
    }
}

extension DashboardCoordinator: HandleSegueDelegate {
    func handleSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showDashboard" {
            let vc = segue.destination as! DashboardViewController
            var viewModel =  DashboardViewModel()
            viewModel.viewController = vc
            viewModel.delegate = self
            vc.coordinationDelegate = self
            vc.viewModel = viewModel
        }
    }
}

extension DashboardCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        
    }
}

extension DashboardCoordinator: DashboardViewModelDelegate {
    
}
