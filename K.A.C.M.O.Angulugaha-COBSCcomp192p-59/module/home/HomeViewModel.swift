//
//  HomeViewModel.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-15.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate: AnyObject {
    
}

struct HomeViewModel {
    
    weak var delegate       : HomeViewModelDelegate?
    weak var viewController : HomeViewController?
    
    func loadParkingSlots(filename fileName: String) -> [ParkingSlot]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseParkingSlotData.self, from: data)
                return jsonData.parkingSlots
            } catch {
                print("error:\(error)")
            }
        }
        
        return nil
    }
}
