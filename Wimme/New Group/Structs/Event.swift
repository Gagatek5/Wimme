//
//  Event.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation

struct Event {
    private(set) public var creator: String?
    private(set) public var date: String?
    private(set) public var place: String?
    private(set) public var title: String?
    private(set) public var description: String?
    private(set) public var eventLocalization: EventLocalization?
    private(set) public var photoUrl: String?
    private(set) public var participantsList: String?
    private(set) public var maxNumberOfParticipants: Int?
    private(set) public var resignationTime: String?
    private(set) public var eventComment: String?
    private(set) public var eventCategory: EventCategories?
    
    init(creator: String? = nil, date: String? = nil, place: String? = nil, title: String? = nil, description: String? = nil, eventLocalization: EventLocalization? = nil, photoUrl: String? = nil, participantsList: String? = nil, maxNumberOfParticipants: Int? = nil, resignationTime: String? = nil, eventComment: String? = nil, eventCategory: EventCategories? = nil) {
        self.creator = creator
        self.date = date
        self.place = place
        self.title = title
        self.description = description
        self.eventLocalization = eventLocalization
        self.photoUrl = photoUrl
        self.participantsList = participantsList
        self.maxNumberOfParticipants = maxNumberOfParticipants
        self.resignationTime = resignationTime
        self.eventComment = eventComment
        self.eventCategory = eventCategory
    }
}
