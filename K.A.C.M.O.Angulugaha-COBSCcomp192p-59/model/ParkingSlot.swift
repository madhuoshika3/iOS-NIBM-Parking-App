//
//  ParkingSlot.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-15.
//

import Foundation

struct ResponseParkingSlotData: Decodable {
    var parkingSlots: [ParkingSlot]
}

struct ParkingSlot: Decodable {
    
    var slotId              : Int                   = 0
    var slotType            : String
    var availabilityStatus  : String
    var vehicleNo           : String                = ""
    var bookedTime          : String                = ""
    
    init(slotId: Int, slotType: String, availabilityStatus: String, vehicleNo: String, bookedTime: String) {
        self.slotId = slotId
        self.slotType = slotType
        self.availabilityStatus = availabilityStatus
        self.vehicleNo = vehicleNo
        self.bookedTime = bookedTime
    }
}

enum SlotType: String, Codable {
    case NormalSlot, VIPSlot
}

enum AvailabilityStatus: String, Codable {
    case Available, Occupied, Booked
}
