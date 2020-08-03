//
//  PresenterHaving.swift
//  Together
//
//  Created by Anastasia Reyngardt on 31.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation


//Все вью, которые обрабатывают actions поддерживают данный протокол и устанавливают себе свойство презентер, в данной функции приводя его к нужному им типу
protocol PresenterHaving {
    func setPresenter(_ presenter: ViewAstions)
}
