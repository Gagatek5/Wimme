//
//  UpdateUserProfile.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class UpdateUserProfile {
    static func updateProfile(firstName: String? = "", lastName: String? = "", photoUrl: String? = "", description: String? = "") {
        if(CheckConnection.checkIfConnectedToFIR()){
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).updateChildValues(["firstName": firstName, "lastName": lastName, "photoUrl": photoUrl, "description": description])
        }
    }
}
