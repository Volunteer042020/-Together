//
//  exampleEvent.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

class Event {
    
    var name: String
    var description: String
    var street: String
    var nameNeedy: String
    var apartment: String
    var progress: Int
    
    init(name: String, description: String, street: String, nameNeedy: String, apartment: String, progress: Int) {
        self.name = name
        self.description = description
        self.street = street
        self.nameNeedy = nameNeedy
        self.apartment = apartment
        self.progress = progress
    }
}
