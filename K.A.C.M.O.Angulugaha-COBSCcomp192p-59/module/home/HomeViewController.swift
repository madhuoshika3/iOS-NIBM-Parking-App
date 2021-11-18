//
//  HomeViewController.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-15.
//

import UIKit
import FirebaseFirestore

class HomeViewController: UIViewController, UICollectionViewDataSource, Coordinated {
    
    var viewModel               : HomeViewModel?
    var coordinationDelegate    : CoordinationDelegate?

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let sectionInsets           = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    private let itemsPerRow : CGFloat   = 2.0
    
    var pakingSlots    : [ParkingSlot] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        readParkingSlots()
    }
    
    // Change the status bar text color
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func readParkingSlots() {
        self.pakingSlots = viewModel?.loadParkingSlots(filename: "parkingSlots") ?? []
        self.collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pakingSlots.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "parkingSlotCell", for: indexPath) as! ParkingSlotCell
        
        let parkingSlot = pakingSlots[indexPath.row]
    
        cell.mainView.backgroundColor = Utils.getStatusColor(availabilityStatus: parkingSlot.availabilityStatus)
        cell.slotTypeLbl.text = parkingSlot.slotType
        cell.availabilityLbl.text = parkingSlot.availabilityStatus
        
        cell.detailsLbl.text = ""
        
        if (parkingSlot.availabilityStatus.lowercased().elementsEqual(AvailabilityStatus.Booked.rawValue.lowercased())) {
            cell.detailsLbl.text = parkingSlot.vehicleNo
        } else if (parkingSlot.availabilityStatus.lowercased().elementsEqual(AvailabilityStatus.Occupied.rawValue.lowercased())) {
            cell.detailsLbl.text = parkingSlot.bookedTime
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let parkingSlot = pakingSlots[indexPath.row]
        
        if (parkingSlot.availabilityStatus.lowercased().elementsEqual(AvailabilityStatus.Available.rawValue.lowercased()))  {
            if Utils.isAuthenticatedUser {
                self.tabBarController?.selectedIndex = 2
            } else {
                self.tabBarController?.selectedIndex = 1
            }
            
        } else {
            Alert.init(title: "Sorry!", msg: "Selected Parking Slot is not avaialable at the moment.", vc: self).show(completion: {_ in
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
