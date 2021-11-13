//
//  SignInViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation
import UIKit
import Firebase
import FirebaseAnalytics

protocol SignInViewModelDelegate: AnyObject {
    
}

struct SignInViewModel {
    
    weak var delegate       : SignInViewModelDelegate?
    weak var viewController : SignInViewController?
    
    func didSelectSignIn(user: User) {
        Auth.auth().signIn(withEmail: user.username, password: user.password) { authResult, error in
            // handle the response
        }
    }
}