//
//  LogIn.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class LogIn {
    static func login(email: String, password: String) {
        if(email == "" || password == "") {
            //Tomek popup -> pusty email lub pass
        } else {
            //LogOut.logOut()
            Auth.auth().signIn(withEmail: email, password: password){(user, error) in
                if(error==nil) {
                    //udalo sie zalogowac
                    //test dodania wydarzenia
//                    let dateString = "2016-03-16"
//                    let localization = EventLocalization(xVariable: 1, yVariable: 1, zVariable: 1)
//                    let url = URL(string: "google.com")
//                    let category = EventCategories(categoryName: "Nauka", categoryPhotoUrl: "google.com")
//                    AddNewEvent.addNewEventToFirebase(date: dateString, place: "OBC", title: "Lets code", description: "Nocne programowanko", eventLocalization: localization, maxNumberOfParticipants: 10, resignationTime: dateString, eventComment: "tomek twardowski - i am in shape of you", eventCategory: category)
                    
                } else {

                }
            }
        }
    }
}
