//
//  SignUpViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation
import UIKit

protocol SignUpViewModelDelegate: AnyObject {
    
}

struct SignUpViewModel {
    
    weak var delegate       : SignUpViewModelDelegate?
    weak var viewController : SignUpViewController?
    
}
