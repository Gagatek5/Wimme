//
//  Register.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class Register {
    static func registerUser(username: String, email: String, pass: String, retypePass: String) {
        if(!CheckConnection.checkIfConnectedToFIR()){
        if(username == "" || email == "" || pass == "" || retypePass == "") {
            //Tomek popup - ktores z pol nie jest uzupelnione
        } else if(pass != retypePass) {
            //Tomek popup - hasla roznia sie od siebie
        } else {
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if(error == nil) {
                    //Tomek ewentualny popup - udalo sie zalogowac
                    let ref = Database.database().reference()
                    ref.child("users").child(user!.uid).setValue(["username": username, "firstName": "", "lastName": "", "email": email, "numberOfVotes": 0, "rating": 0, "frequency": 0, "photoUrl": "", "description": ""])
                    let user = Auth.auth().currentUser
                    let changeRequest = user?.createProfileChangeRequest()
                    changeRequest?.displayName = username
                    changeRequest?.commitChanges()
                    print("user added")
                    //ref.child("usernames").child(username)
                } else {
                    //Tomek popup - ten email jest juz wykorzystywany
                    print("Uzytkownik z takim emailem juz istnieje")
                }
            }
        }
        }
    }
}
