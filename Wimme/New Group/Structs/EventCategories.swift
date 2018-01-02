//
//  EventCategories.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation

struct EventCategories {
    private(set) public var categoryName: String
    private(set) public var categoryPhotoUrl: String
    
    init(categoryName: String, categoryPhotoUrl: String) {
        self.categoryName = categoryName
        self.categoryPhotoUrl = categoryPhotoUrl
    }
}
