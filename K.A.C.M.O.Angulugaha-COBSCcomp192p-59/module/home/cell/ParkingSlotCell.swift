//
//  ParkingSlotCell.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-15.
//

import UIKit

class ParkingSlotCell: UICollectionViewCell {
    
    @IBOutlet weak var outlineView       : UIView!
    @IBOutlet weak var mainView          : UIView!
    @IBOutlet weak var slotTypeLbl       : UILabel!
    @IBOutlet weak var availabilityLbl   : UILabel!
    @IBOutlet weak var detailsLbl        : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
