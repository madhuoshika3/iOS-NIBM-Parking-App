//
//  LauncherCoordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

protocol LauncherCoordinatorDelegate: HandleSegueDelegate {
    
}

class LauncherCoordinator: Coordinator {
    
    var window          : UIWindow
    weak var delegate   : LauncherCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let nav = storyboard.instantiateInitialViewController() as? UINavigationController {
            let vc = nav.viewControllers.first as! LauncherViewController
            var viewModel =  LauncherViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            window.rootViewController = vc
        }
    }
}

extension LauncherCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showDashboard" {
            delegate?.handleSegue(segue: segue)
        }
    }
}

extension LauncherCoordinator: LauncherViewModelDelegate {
    func launcherViewModelDidSelectGoToDashboard(viewController: UIViewController) {
        viewController.performSegue(withIdentifier: "showDashboard", sender: viewController)
    }
}
