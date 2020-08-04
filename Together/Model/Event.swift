//
//  exampleEvent.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//
import MapKit


final class Event {
    
    //TODO Скорее всего сделать модель User с полями имя, телефон, чтоб вместо nameNeedy сразу вбивать контакты нуждающегося
    
    let id: Int
    var title: String
    var description: String?
    var address: Address
    var coordinate: CLLocationCoordinate2D
    var nameNeedy: String?
    var progress: Int
    
    init(id: Int, title: String, description: String?, address: Address, coordinate: CLLocationCoordinate2D, nameNeedy: String, progress: Int = 0) {
        self.id = id
        self.title = title
        self.description = description
        self.address = address
        self.coordinate = coordinate
        self.nameNeedy = nameNeedy
        self.progress = progress
    }
    
}
