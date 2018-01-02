//
//  CheckConnection.swift
//  Wimme
//
//  Created by Młody-MBP on 19.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class CheckConnection {
    static func checkIfConnectedToFIR() -> Bool {
        var ifLoggedIn: Bool
        if(Auth.auth().currentUser != nil) {
            ifLoggedIn = true
        } else {
            ifLoggedIn = false
        }
        return ifLoggedIn
    }
}
