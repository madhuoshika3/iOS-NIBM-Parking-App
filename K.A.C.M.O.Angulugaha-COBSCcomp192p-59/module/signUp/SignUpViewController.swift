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

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.signInAction))
        self.signInContainer.addGestureRecognizer(gesture)
    }
    
    @objc func signInAction(sender : UITapGestureRecognizer) {
        
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpClicked(_ sender: UIButton) {
        if (usernameTF.text?.isEmpty ?? true || passwordTF.text?.isEmpty ?? true || confirmPasswordTF.text?.isEmpty ?? true) {
            Alert.init(title: "Error", msg: "Please fill all the required fields.", vc: self).show(completion: {_ in })
        } else {
            // Email validation
            if !Utils.isValidEmailAddress(emailAddressString: usernameTF.text ?? "") {
                Alert.init(title: "Error", msg: "Please enter a valid e-mail address.", vc: self).show(completion: {_ in})
            } else if (passwordTF.text != confirmPasswordTF.text) {
                Alert.init(title: "Error", msg: "Password and the confirm password should be same.", vc: self).show(completion: {_ in})
            } else {
                let user = User.init(username: usernameTF.text ?? "", password: passwordTF.text ?? "")
                let addedSuccessfully = (self.viewModel?.didSelectSignUp(user: user))!
                
                if addedSuccessfully {
                    
                    Alert.init(title: "Info", msg: "User added successfully.", vc: self).show(completion: {_ in})
                    
                    usernameTF.text = ""
                    passwordTF.text = ""
                    confirmPasswordTF.text = ""
                } else {
                    Alert.init(title: "Error", msg: "Someting went wrong. Please try again.", vc: self).show(completion: {_ in})
                }
            }
        }
    }
}
