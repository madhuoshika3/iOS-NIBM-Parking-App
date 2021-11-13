//
//  LauncherViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation
import UIKit

protocol LauncherViewModelDelegate: AnyObject {
    func launcherViewModelDidSelectGoToDashboard(viewController: UIViewController)
}

struct LauncherViewModel {
    
    weak var delegate       : LauncherViewModelDelegate?
    weak var viewController : LauncherViewController?
    
    func didSelectGoToDashboard() {
        delegate?.launcherViewModelDidSelectGoToDashboard(viewController: self.viewController!)
    }
}
