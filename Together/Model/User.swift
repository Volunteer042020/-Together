//
//  User.swift
//  Together
//
//  Created by Евгений Шварцкопф on 30.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

final class User {
    
    var id: Int
    var name: String
    var phone: String?
    var email: String
    var aboutMe: String?
    
    init(id: Int, name: String, phone: String, email: String, aboutMe: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.email = email
        self.aboutMe = aboutMe
    }
    
}
