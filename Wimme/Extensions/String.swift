//
//  String.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import Foundation
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let emailTest = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return emailTest.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    func isPasswordValid() -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,32}")
        return passwordTest.evaluate(with: self)
    }
}
