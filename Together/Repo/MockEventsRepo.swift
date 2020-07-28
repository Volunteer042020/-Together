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
        
        events.append(Event(title: "Помощь с покупками в магазине",
                            description: "Хлеб, молоко, яйца и муку!",
                            address: Address(city: "Омск", street: "ул. Нефтезаводская", house: "32", apartment: 23),
                            coordinate: CLLocationCoordinate2D(latitude: 55.0394917, longitude: 73.2613516),
                            nameNeedy: "Мария Иванова"))
        
        events.append(Event(title: "Купить Медикоменты",
                            description: "Флюконазол, аналгин и парацетамол",
                            address: Address(city: "Омск", street: "ул. Культура проспект", house: "3", apartment: 2),
                            coordinate: CLLocationCoordinate2D(latitude: 55.0281635, longitude: 73.2760158),
                            nameNeedy: "Макс Фодеев"))
        
        events.append(Event(title: "Купить Матрац",
                            description: "Матрац 1 метр для ребенка",
                            address: Address(city: "Омск", street: "ул. проспект Мира", house: "16 А", apartment: 25),
                            coordinate: CLLocationCoordinate2D(latitude: 55.0253149, longitude: 73.2980531),
                            nameNeedy: "Петр Миронов"))
    }
    
}
