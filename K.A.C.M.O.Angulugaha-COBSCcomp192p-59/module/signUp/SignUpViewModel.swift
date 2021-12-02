//
//  SignUpViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation
import UIKit
import Firebase

protocol SignUpViewModelDelegate: AnyObject {
    
}

struct SignUpViewModel {
    
    weak var delegate       : SignUpViewModelDelegate?
    weak var viewController : SignUpViewController?
    
    func didSelectSignUp(user: User) -> Bool {
        
        var addedSuccessfully   = false
        
        Auth.auth().createUser(withEmail: user.username, password: user.password) { authResult, error in
            
            if error == nil {
                addedSuccessfully = true
            } else {
                addedSuccessfully = false
            }
        }
        
        return addedSuccessfully
    }
}
