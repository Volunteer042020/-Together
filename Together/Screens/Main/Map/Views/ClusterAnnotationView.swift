//
//  ClusterAnnotationView.swift
//  Together
//
//  Created by Anastasia Reyngardt on 04.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import MapKit


class ClusterAnnotationView: MKAnnotationView {
    
    //MARK: - Init
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        collisionMode = .circle
        centerOffset = CGPoint(x: 0, y: -10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func prepareForDisplay() {
        super.prepareForDisplay()
        
        if let cluster = annotation as? MKClusterAnnotation {
            let totalEvents = cluster.memberAnnotations.count
            cluster.subtitle = "+ еще \(totalEvents - 1)"
            image = drawEventCount(count: totalEvents)
            displayPriority = .defaultLow
        }
    }
    
    //MARK: - Private metods
    private func drawEventCount(count: Int) -> UIImage {
        //return drawRatio(to: count, wholeColor: UIColor.redButton)
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: viewDiameter, height: viewDiameter))
        return renderer.image { _ in
            
            UIColor.redButton.setFill()
            UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: viewDiameter, height: viewDiameter)).fill()
            
            UIColor.white.setFill()
            let offset = (viewDiameter - viewInternalDiametr) / 2
            UIBezierPath(ovalIn: CGRect(x: offset, y: offset, width: viewInternalDiametr, height: viewInternalDiametr)).fill()
            
            let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.black,
                               NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: textSize)]
            let text = count < 100 ? "\(count)" : "99+"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: viewDiameter / 2 - size.width / 2, y: viewDiameter / 2 - size.height / 2, width: size.width, height: size.height)
            text.draw(in: rect, withAttributes: attributes)
        }
    }
}


//MARK: - Size property
extension ClusterAnnotationView {
    private var viewDiameter: CGFloat { return 40 }
    private var viewInternalDiametr: CGFloat { return 30 }
    
    private var textSize: CGFloat { return 15 }
    
}
