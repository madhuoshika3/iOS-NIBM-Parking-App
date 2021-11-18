//
//  BookingViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-18.
//

import Foundation
import UIKit

protocol BookingViewModelDelegate: AnyObject {
    
}

struct BookingViewModel {
    
    weak var delegate       : BookingViewModelDelegate?
    weak var viewController : BookingViewController?
    
}
