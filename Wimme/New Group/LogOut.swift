//
//  LogOut.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class LogOut {
    static func logOut() {
        do{
            try Auth.auth().signOut()
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
