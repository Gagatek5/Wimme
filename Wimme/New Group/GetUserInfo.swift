//
//  GetUserInfo.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class GetUserInfo {
    static func getUserInfo(completion: @escaping (Profile) -> Void) {
        if(CheckConnection.checkIfConnectedToFIR()){
        var userInformations = Profile()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observe(DataEventType.value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String
            let firstName = value?["firstName"] as? String
            let lastName = value?["lastName"] as? String
            let email = value?["email"] as? String
            let rating = value?["rating"] as? Float
            let frequency = value?["frequency"] as? Int
            let photoUrl = value?["photoUrl"] as? String
            let description = value?["description"] as? String
            userInformations = Profile(username: username, firstName: firstName, lastName: lastName, email: email, rating: rating, frequency: frequency, photoUrl: photoUrl, description: description)
            completion(userInformations)
        }) { (error) in
            //nie udalo sie wyciagnac infa.
            print("Nie udalo sie wydobyc informacji")
            print(error.localizedDescription)
        }
    }
    }
}
