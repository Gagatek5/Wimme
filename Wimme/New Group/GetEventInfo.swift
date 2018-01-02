//
//  GetEventInfo.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
import Firebase

class GetEventInfo {
    // Zwroc eventy i nasluchuj zmian
    static func getEventsDetails() {
        var eventsArray = [Event]()
        var counter = 0
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let eventRef = ref.child("events")
        eventRef.observe(DataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount>0{
                eventsArray.removeAll()
                for events in snapshot.children.allObjects as![DataSnapshot]{
                    let eventObject = events.value as? [String: AnyObject]
                    let creator = eventObject?["creator"] as! String
                    let date = eventObject?["date"] as! String
                    let description = eventObject?["description"] as! String
                    let eventComment = eventObject?["eventComment"] as! String
                    let maxNumberOfParticipants = eventObject?["maxNumberOfParticipants"] as! Int
                    let place = eventObject?["place"] as! String
                    let resignationTime = eventObject?["resignationTime"] as! String
                    let title = eventObject?["title"] as! String
                    let eventCategoryName = eventObject?["eventCategoryName"] as! String
                    let eventCategoryPhotoUrl = eventObject?["eventCategoryPhotoUrl"] as! String
                    let xVariable = eventObject?["xVariable"] as! Float
                    let yVariable = eventObject?["yVariable"] as! Float
                    let zVariable = eventObject?["zVariable"] as! Float
                    let eventLoc = EventLocalization(xVariable: xVariable, yVariable: yVariable, zVariable: zVariable)
                    let eventCat = EventCategories(categoryName: eventCategoryName, categoryPhotoUrl: eventCategoryPhotoUrl)
                    let events = Event(creator: creator, date: date, place: place, title: title, description: description, eventLocalization: eventLoc, maxNumberOfParticipants: maxNumberOfParticipants, resignationTime: resignationTime, eventComment: eventComment, eventCategory: eventCat)
                    eventsArray.insert(events, at: counter)
                    counter = counter + 1
                }
            }
            print(eventsArray[0].description)
            print(eventsArray[1].description)
            print(eventsArray[2].description)
            print(eventsArray[0].eventLocalization?.xVariable)
            print(eventsArray[1].eventLocalization?.xVariable)
            print(eventsArray[2].eventLocalization?.xVariable)
        })
    }
}
