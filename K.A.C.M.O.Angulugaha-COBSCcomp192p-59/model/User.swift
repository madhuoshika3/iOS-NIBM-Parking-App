//
//  User.swift
//  K.A.C.M.O.Angulugaha-COBSCcomp192p-59
//
//  Created by Madhu Oshika Angulugaha on 2021-11-13.
//

import Foundation

struct User: Decodable {
    
    var username: String = ""
    var password: String = ""
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}
