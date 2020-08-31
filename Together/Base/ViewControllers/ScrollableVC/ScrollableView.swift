//
//  ScrollableView.swift
//  Together
//
//  Created by Anastasia Reyngardt on 31.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit


class ScrollableView: UIView {
    
    enum SlideUpViewState {
        case expanded
        case halfScreen
        case collapsed
    }
    
    //MARK: - Open properties
    private(set) var viewState: SlideUpViewState = .collapsed
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    //MARK: - Open metods
    func animateView(toState state: SlideUpViewState) {
        performAnimation(toState: state)
    }
    
    //MARK: - Private metods
    private func setupUI() {
        
        self.frame = getFrame(forState: .collapsed)
        self.backgroundColor = UIColor.white
        
        addCornerRadius()
        addShadow()
        
        let moveGesture = UIPanGestureRecognizer.init(target: self, action: #selector(movePanGesture))
        self.addGestureRecognizer(moveGesture)
    }
    
    private func getFrame(forState state: SlideUpViewState) -> CGRect {
        
        let width = UIScreen.main.bounds.width
        switch state {
        case .collapsed:
            return CGRect(x: 0, y: collapsedYPosition, width: width, height: expandedViewHeight)
        case .halfScreen:
            return CGRect(x: 0, y: halfScreenYPosition, width: width, height: halfScreenViewHeight)
        case .expanded:
            return CGRect(x: 0, y: expandedYPosition, width: width, height: expandedViewHeight)
        }
    }
    
    private func addCornerRadius() {
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.clipsToBounds = true
    }
    
    private func addShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 2
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    @objc func movePanGesture(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            moveView(panGestureRecognizer: sender)
        }
        
        if sender.state == .ended {
            let position = self.frame.minY
            let center = ((collapsedYPosition - expandedYPosition) / 2)
            let state: SlideUpViewState = expandedYPosition + center > position ? .expanded : .collapsed
            animateView(toState: state)
        }
    }
    
    private func moveView(state: SlideUpViewState) {
        self.frame = getFrame(forState: state)
    }
    
    private func moveView(panGestureRecognizer recognizer: UIPanGestureRecognizer) {
        let newYPosition = self.frame.minY + recognizer.translation(in: self).y
        
        if(newYPosition >= expandedYPosition) && (newYPosition <= collapsedYPosition) {
            self.frame = CGRect(x: 0, y: newYPosition, width: self.frame.width, height: expandedViewHeight)
            recognizer.setTranslation(CGPoint.zero, in: self)
        }
    }
    
    private func performAnimation(toState state: SlideUpViewState) {
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 1.0,
                       animations: {
                        self.frame = self.getFrame(forState: state)
        },
                       completion: { _ in
                        self.viewState = state
        })
    }
}


//MARK: - Size constant
fileprivate extension ScrollableView {
    
    private var expandedViewHeight: CGFloat {
        return UIScreen.main.bounds.height - 200
    }
    
    private var halfScreenViewHeight: CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    private var collapsedViewHeight: CGFloat {
        return 150
    }
    
    private var expandedYPosition: CGFloat {
        return UIScreen.main.bounds.height - expandedViewHeight
    }
    
    private var halfScreenYPosition: CGFloat {
        return UIScreen.main.bounds.height - halfScreenViewHeight
    }
    
    private var collapsedYPosition: CGFloat {
        return UIScreen.main.bounds.height - collapsedViewHeight
    }
}
