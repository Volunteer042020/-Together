//
//  ActionEventView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ActionEventViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: ActionEventViewAction)
}

final class ActionEventView: UIView {
    
    var arrayEvent: [Event] = [Event(name: "Продукты", description: "Необходимо купить хлеб, молоко, масло, яйца и гречку", street: "ул.50 лет Профсоюзов 92A", nameNeedy: "Иван Петров", apartment: "25", progress: 1),Event(name: "Медикоменты", description: "Необходимо купить анальгин, флюконазол, ношпу, цикловир и бинт", street: "ул.Нефтезаводская 5", nameNeedy: "Егор Марсианов", apartment: "34", progress: 1)]
    
    //MARK: - Private properties
    private var presenter: ActionEventViewAction?
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false 
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        flow.scrollDirection = .vertical
        return collectionView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        
        backgroundColor = .white
        
        addSubview(collectionView)
        collectionView.register(UINib(nibName: "ActionEventCell", bundle: nil), forCellWithReuseIdentifier: "actionEventCell")
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}

extension ActionEventView: ActionEventViewImpl {
    
    func setPresenter(_ presenter: ActionEventViewAction) {
        self.presenter = presenter
    }
}

extension ActionEventView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 440, height: 300)
    }
}

extension ActionEventView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayEvent.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "actionEventCell", for: indexPath) as? ActionEventCell else { return UICollectionViewCell() }
        let model = arrayEvent[indexPath.row]
        cell.renderCell(model: model)
        return cell
    }
    

}
