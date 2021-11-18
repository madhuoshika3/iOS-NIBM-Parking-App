//
//  ParkingSlotCell.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-15.
//

import UIKit

class ParkingSlotCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView          : UIView!
    @IBOutlet weak var slotTypeLbl       : UILabel!
    @IBOutlet weak var availabilityLbl   : UILabel!
    @IBOutlet weak var detailsLbl        : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 5
        mainView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        slotTypeLbl.font = UIFont(name: "OpenSans-Bold", size: 14)
        availabilityLbl.font = UIFont(name: "OpenSans-Bold", size: 14)
        detailsLbl.font = UIFont(name: "OpenSans-Regular", size: 12)
    }
    
}
