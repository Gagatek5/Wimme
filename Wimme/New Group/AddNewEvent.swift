//
//  AddNewEvent.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class AddNewEvent {
    static func addNewEventToFirebase(date: String, place: String, title: String, description: String, eventLocalization: EventLocalization, photoUrl: String? = nil, maxNumberOfParticipants: Int, resignationTime: String, eventComment: String, eventCategory: EventCategories) {
        if(CheckConnection.checkIfConnectedToFIR()){
        let ref = Database.database().reference()
        var userID = Auth.auth().currentUser?.uid
        var creatorNickname = Auth.auth().currentUser?.email
        let direction = ref.child("events").childByAutoId()
        direction.setValue(["creator": creatorNickname, "date": date, "place": place, "title": title, "description": description, "photoUrl": photoUrl, "maxNumberOfParticipants": maxNumberOfParticipants, "resignationTime": resignationTime, "eventComment": eventComment, "eventCategoryName": eventCategory.categoryName, "eventCategoryPhotoUrl": eventCategory.categoryPhotoUrl, "xVariable": eventLocalization.xVariable, "yVariable": eventLocalization.yVariable, "zVariable": eventLocalization.zVariable])
    }
    }
}
