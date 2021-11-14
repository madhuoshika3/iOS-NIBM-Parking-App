//
//  SignUpViewController.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

class SignUpViewController: UIViewController, Coordinated {
    
    var viewModel               : SignUpViewModel?
    var coordinationDelegate    : CoordinationDelegate?
    
    @IBOutlet weak var usernameTF       : UITextField!
    @IBOutlet weak var passwordTF       : UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var signInContainer  : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
       
    }
}
