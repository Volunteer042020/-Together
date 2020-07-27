//
//  MockEventsRepo.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation
import MapKit


final class MockEventsRepo {
    
    static let sharedData = MockEventsRepo()
    var events = [Event]()
    
    private init() {
        
        events.append(Event(title: "Помощь бабушке",
                            description: "Купить анальгин",
                            address: Address(city: "Белгород", street: "Курская улица", house: "10", apartment: 1, entrance: 1, floor: 1),
                            coordinate: CLLocationCoordinate2D(latitude: 50.612850899999998, longitude: 36.572460999999997),
                            nameNeedy: "Феофана Иосиевна"))
        events.append(Event(title: "Помощь дедушке",
                            description: "Купить анальгин",
                            address: Address(city: "Белгород", street: "Курская улица", house: "8", apartment: 2, entrance: 2, floor: 2),
                            coordinate: CLLocationCoordinate2D(latitude: 50.613990800000003, longitude: 36.572013800000001),
                            nameNeedy: "Анастасий Леонидович"))
        events.append(Event(title: "Помощь маме",
                            description: "Купить анальгин",
                            address: Address(city: "Белгород", street: "Курская улица", house: "12", apartment: 3, entrance: 3, floor: 3),
                            coordinate: CLLocationCoordinate2D(latitude: 50.612569651378742, longitude: 36.570470652355993),
                            nameNeedy: "Степана Игоревна"))
    }
    
}
