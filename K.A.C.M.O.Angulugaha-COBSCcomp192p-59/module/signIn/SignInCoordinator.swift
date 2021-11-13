//
//  SignInCoordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

protocol SignInCoordinatorDelegate: HandleSegueDelegate {
    
}

class SignInCoordinator: Coordinator {
    
    var window          : UIWindow
    weak var delegate   : SignInCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "signInVC") as? SignInViewController {
            var viewModel =  SignInViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            let nav = UINavigationController.init(rootViewController: vc)
            window.rootViewController = nav
        }
    }
}

extension SignInCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        if segue.identifier == "showSignUp" {
            delegate?.handleSegue(segue: segue)
        }
    }
}

extension SignInCoordinator: SignInViewModelDelegate {
    
}
