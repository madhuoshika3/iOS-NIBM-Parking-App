//
//  BookingViewController.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-18.
//

import UIKit

class BookingViewController: UIViewController, Coordinated {
    
    var viewModel               : BookingViewModel?
    var coordinationDelegate    : CoordinationDelegate?

    @IBOutlet weak var registrationNoLbl    : UILabel!
    @IBOutlet weak var vehicleNoLbl         : UILabel!
    @IBOutlet weak var slotsOptionTF        : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registrationNoLbl.text = Utils.registrationNo
        vehicleNoLbl.text = Utils.vehicleNo
    }
}
