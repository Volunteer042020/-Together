//
//  CompletionEventView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 21.07.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol CompletionEventViewImpl {
    //функции типа, покажи данные
    func setPresenter(_ presenter: CompletionEventViewAction)
}

final class CompletionEventView: UIView {
    
    var arrayEvent: [Event] = [/*Event(title: "Продукты", description: "Необходимо купить хлеб, молоко, масло, яйца и гречку", address: "ул.50 лет Профсоюзов 92A", nameNeedy: "Иван Петров", progress: 0),Event(title: "Медикоменты", description: "Необходимо купить анальгин, флюконазол, ношпу, цикловир и бинт", address: "ул.Нефтезаводская 5", nameNeedy: "Егор Марсианов", progress: 2)*/]
    
    //MARK: - Private properties
    private var presenter: CompletionEventViewAction?
    
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
        collectionView.register(UINib(nibName: "CompletionEventCell", bundle: nil), forCellWithReuseIdentifier: "completionEventCell")
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}

extension CompletionEventView: CompletionEventViewImpl {
    
    func setPresenter(_ presenter: CompletionEventViewAction) {
        self.presenter = presenter
    }
}

extension CompletionEventView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 440, height: 300)
    }
}

extension CompletionEventView: UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayEvent.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "completionEventCell", for: indexPath) as? CompletionEventCell else { return UICollectionViewCell() }
        let model = arrayEvent[indexPath.row]
        cell.renderCell(model: model)
        return cell
    }
}
