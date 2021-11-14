//
//  ParkingSlot.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-15.
//

import Foundation

struct ParkingSlot: Decodable {
    
    var slotType            : SlotType
    var availabilityStatus  : AvailabilityStatus
    var vehicleNo           : String                = ""
    var bookedTime          : String                = ""
    
    init(slotType: SlotType, availabilityStatus: AvailabilityStatus, vehicleNo: String, bookedTime: String) {
        self.slotType = slotType
        self.availabilityStatus = availabilityStatus
        self.vehicleNo = vehicleNo
        self.bookedTime = bookedTime
    }
    
}

enum AvailabilityStatus: String, Codable {
    case Available, Occupied, Booked
}

enum SlotType: String, Codable {
    case VIPSlot, NormalSlot
}
