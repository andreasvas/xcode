//
//  AnnotationPin.swift
//  PinView
//
//  Created by Andreas Vasileiou on 30/07/2020.
//  Copyright © 2020 Andreas Vasileiou. All rights reserved.
//

import UIKit
import MapKit

class AnnotationPin: NSObject, MKAnnotation {
     
    enum pinType {
        case parking
        case cafe
    }
    
    var coordinate: CLLocationCoordinate2D
    var phone: String!
    var name: String!
    var address: String!
    var image: UIImage!
    var type: pinType!
    
    init(coordinate: CLLocationCoordinate2D, pinName:String, pinAddress:String, pinPhone:String, pinImage:UIImage, pintype:pinType) {
        self.coordinate = coordinate
        self.name = pinName
        self.address = pinAddress
        self.phone = pinPhone
        self.image = pinImage
        self.type = pintype
    }
    
}
