//
//  BookingCoordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-18.
//

import UIKit

protocol BookingCoordinatorDelegate: HandleSegueDelegate {
    
}

class BookingCoordinator: Coordinator {
    
    var window          : UIWindow
    weak var delegate   :BookingCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "bookingVC") as? BookingViewController {
            var viewModel =  BookingViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            let nav = UINavigationController.init(rootViewController: vc)
            window.rootViewController = nav
        }
    }
    
    func getViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "bookingVC") as? BookingViewController {
            var viewModel =  BookingViewModel()
            viewModel.delegate = self
            viewModel.viewController = vc
            vc.viewModel = viewModel
            vc.coordinationDelegate = self
            
            return vc
        }
        return BookingViewController()
    }
}

extension BookingCoordinator: CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue) {
        
    }
}

extension BookingCoordinator: BookingViewModelDelegate {
    
}
