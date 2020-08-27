//
//  SlideMenuTableViewProvider.swift
//  Together
//
//  Created by Anastasia Reyngardt on 27.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SlideMenuTableViewProviderImpl {
    func showContent(data: [Category])
}


final class SlideMenuTableViewProvider: NSObject, TableViewProvider {
    
    //MARK: - Private properties
    private let tableView: UITableView
    private var categories: [Category]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Init
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SlideMenuCell.reuseId,
            for: indexPath)
            as? SlideMenuCell,
            let category = categories?[indexPath.row]
            else { return UITableViewCell() }
        
        cell.showCategory(category)
        return cell
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}


//MARK: - SlideMenuTableViewProviderImpl
extension SlideMenuTableViewProvider: SlideMenuTableViewProviderImpl {
    
    func showContent(data: [Category]) {
        self.categories = data
    }
}

