//
//  Coordinator.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

protocol HandleSegueDelegate: AnyObject {
    func handleSegue(segue: UIStoryboardSegue)
}

protocol CoordinationDelegate {
    func prepareForSegue(segue: UIStoryboardSegue)
}

protocol Coordinated {
    var coordinationDelegate: CoordinationDelegate? { get set }
}
