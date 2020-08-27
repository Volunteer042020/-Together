//
//  MockCategoryRepo.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


final class MockCategoryRepo {
    
    static let sharedData = MockCategoryRepo()
    var categories = [Category]()
    
    private init() {
        
        categories = [Category(name: "Продукты", imageName: "cart.fill", color: .marineButton),
                      Category(name: "Физическая", imageName: "person.3.fill", color: .customGray),
                      Category(name: "Медикоменты", imageName: "staroflife.fill", color: .redButton),
                      Category(name: "По дому", imageName: "house.fill", color: .grayLocationButton),
                      Category(name: "С переездом", imageName: "car.fill", color: .blueButton)]
    }
}
