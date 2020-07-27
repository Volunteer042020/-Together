//
//  Address.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


final class Address {
    
    var country: String
    var city: String
    var street: String
    var house: String //т.к. может быть 31а, 31к1
    var apartment: Int
    var entrance: Int?
    var floor: Int?
    
    var addressDescription: String {
        return city + ", " + street + ", " + house
    }
    
    init(country: String = "Россия", city: String, street: String, house: String, apartment: Int, entrance: Int? = nil, floor: Int? = nil) {
        self.country = country
        self.city = city
        self.street = street
        self.house = house
        self.apartment = apartment
        self.entrance = entrance
        self.floor = floor
    }
}
