//
//  DashboardViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation
import UIKit

protocol DashboardViewModelDelegate: AnyObject {
    
}

struct DashboardViewModel {
    
    weak var delegate       : DashboardViewModelDelegate?
    weak var viewController : DashboardViewController?
    
}
