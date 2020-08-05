//
//  AnnotationPinView.swift
//  PinView
//
//  Created by Andreas Vasileiou on 31/07/2020.
//  Copyright © 2020 Andreas Vasileiou. All rights reserved.
//


import MapKit
import UIKit

class AnnotationPinView: MKMarkerAnnotationView {

    //    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
//        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
//        self.canShowCallout = true
//        self.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//    }
    override var annotation: MKAnnotation? {
        willSet {
            if let pin = newValue as? AnnotationPin {
                clusteringIdentifier = "parkings"
              
                canShowCallout = true
              
                if pin.type == .parking {
                    markerTintColor = UIColor(named: "Color")
                    glyphImage = UIImage(named: "pin")
                    displayPriority = .defaultHigh
                } else if pin.type == .cafe {
                    markerTintColor = UIColor(named: "cafeCol")
                    glyphImage = UIImage(named: "cafePin")
                    displayPriority = .defaultHigh
                }
            }
        }
    }
     override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            let hitView = super.hitTest(point, with: event)
            if hitView != nil {
                superview?.bringSubviewToFront(self)
            }
            return hitView
        }
    
        override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
            let rect = self.bounds
            var isInside = rect.contains(point)
            if !isInside {
                for view in subviews {
                    isInside = view.frame.contains(point)
                    if isInside {
                        break
                    }
                }
            }
            return isInside
        }
    }

