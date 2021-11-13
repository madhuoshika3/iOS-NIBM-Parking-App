//
//  LauncherViewController.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-12.
//

import UIKit

class LauncherViewController: UIViewController, Coordinated {

    var viewModel               : LauncherViewModel?
    var coordinationDelegate    : CoordinationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.viewModel?.didSelectGoToDashboard()
        }
    }

}

