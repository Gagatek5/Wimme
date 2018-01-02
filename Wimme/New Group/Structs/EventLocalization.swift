//
//  EventLocalization.swift
//  Wimme
//
//  Created by Młody-MBP on 18.11.2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation

struct EventLocalization {
    private(set) public var xVariable: Float!
    private(set) public var yVariable: Float!
    private(set) public var zVariable: Float!
    
    init(xVariable: Float, yVariable: Float, zVariable: Float) {
        self.xVariable = xVariable
        self.yVariable = yVariable
        self.zVariable = zVariable
    }
}
