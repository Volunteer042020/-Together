//
//  EventAnnotationView.swift
//  Together
//
//  Created by Anastasia Reyngardt on 04.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import MapKit


class EventAnnotationView: MKMarkerAnnotationView {
    
    //MARK: - Open properties
    static let reuseID = "eventAnnotation"
    
    //MARK: - Init
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        clusteringIdentifier = "eventCluster"
        
        self.canShowCallout = true
        self.rightCalloutAccessoryView = UIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK: - Life cycle
    override func prepareForDisplay() {
        super.prepareForDisplay()
        
        displayPriority = .defaultLow
        markerTintColor = .redButton
        glyphImage = #imageLiteral(resourceName: "glyphImage")
    }
}
