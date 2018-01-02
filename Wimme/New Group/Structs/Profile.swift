//
//  Profile.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation

struct Profile{
    private(set) public var username: String?
    private(set) public var firstName: String?
    private(set) public var lastName: String?
    private(set) public var email: String?
    private(set) public var numberOfVotes: Int?
    private(set) public var rating: Float?
    private(set) public var frequency: Int?
    private(set) public var photoUrl: String?
    private(set) public var description: String?
    
    init(username: String? = "", firstName: String? = "", lastName: String? = "", email: String? = "", numberOfVotes: Int? = 0, rating: Float? = 0, frequency: Int? = 0, photoUrl: String? = "", description: String? = "") {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.numberOfVotes = numberOfVotes
        self.rating = rating
        self.frequency = frequency
        self.photoUrl = photoUrl
        self.description = description
    }
}
