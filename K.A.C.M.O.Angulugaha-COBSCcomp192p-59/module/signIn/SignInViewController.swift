//
//  SignInViewController.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import UIKit

class SignInViewController: UIViewController, Coordinated {
    
    var viewModel               : SignInViewModel?
    var coordinationDelegate    : CoordinationDelegate?

    @IBOutlet weak var signUpContainer  : UIView!
    @IBOutlet weak var usernameTF       : UITextField!
    @IBOutlet weak var passwordTF       : UITextField!
    
//    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.signUpAction))
        self.signUpContainer.addGestureRecognizer(gesture)
    }
    
    @objc func signUpAction(sender : UITapGestureRecognizer) {
        let appCoordinator = AppCoordinator(window: UIApplication.shared.keyWindow!)
        appCoordinator.loadSignUp()
    }
}

// IBActions
extension SignInViewController {
    @IBAction func forgotPasswordClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func signInClicked(_ sender: UIButton) {
        if (usernameTF.text?.isEmpty ?? true || passwordTF.text?.isEmpty ?? true) {
            Alert.init(title: "Error", msg: "Please fill all the required fields.", vc: self).show(completion: {_ in })
        } else {
            // Email validation
            if !Utils.isValidEmailAddress(emailAddressString: usernameTF.text ?? "") {
                Alert.init(title: "Error", msg: "Please enter a valid e-mail address.", vc: self).show(completion: {_ in

                })
            } else {
                let user = User.init(username: usernameTF.text ?? "", password: passwordTF.text ?? "")
                let authenticateUser = self.viewModel?.didSelectSignIn(user: user) ?? false
                
                if authenticateUser {
                    self.tabBarController?.selectedIndex = 2
                } else {
                    Alert.init(title: "Error!", msg: "Something went wrong.", vc: self).show(completion: {_ in
                    })
                }
            }
        }
    }

}
