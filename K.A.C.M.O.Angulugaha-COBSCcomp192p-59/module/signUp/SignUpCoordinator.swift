//
//  SignUpCoordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

protocol SignUpCoordinatorDelegate: HandleSegueDelegate {
    
}

class SignUpCoordinator: Coordinator {
    
    var window          : UIWindow
    weak var delegate   : SignUpCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "signUpVC") as? SignUpViewController {
            var viewModel =  SignUpViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            let nav = UINavigationController.init(rootViewController: vc)
            window.rootViewController = nav
        }
    }
}

extension SignUpCoordinator: HandleSegueDelegate {
    func handleSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showSignUp" {
            let vc = segue.destination as! SignUpViewController
            var viewModel =  SignUpViewModel()
            viewModel.viewController = vc
            viewModel.delegate = self
            vc.coordinationDelegate = self
            vc.viewModel = viewModel
        }
    }
}

extension SignUpCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        
    }
}

extension SignUpCoordinator: SignUpViewModelDelegate {
    
}
