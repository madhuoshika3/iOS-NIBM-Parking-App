//
//  Utils.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation
import UIKit

class Utils {
    
    static var isAuthenticatedUser  = false
    static var registrationNo       = "NIBM_PS_76347"
    static var vehhicleNo           = "KB1363"
    
    static func getStatusColor(availabilityStatus: String) -> UIColor {
        
        let availabilityStatus = availabilityStatus.lowercased()
        
        if (availabilityStatus.elementsEqual(AvailabilityStatus.Available.rawValue.lowercased())) {
            return UIColor(named: "light_green") ?? UIColor.lightGray
        } else if (availabilityStatus.elementsEqual(AvailabilityStatus.Booked.rawValue.lowercased())) {
            return UIColor(named: "light_yellow") ?? UIColor.lightGray
        } else {
            return UIColor(named: "light_red") ?? UIColor.lightGray
        }
    }
    
    static func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
}
