//
//  ViewController.swift
//  PinView
//
//  Created by Andreas Vasileiou on 30/07/2020.
//  Copyright © 2020 Andreas Vasileiou. All rights reserved.
//
import UIKit
import MapKit


// добавили mkmmap, чтобы работать с кастомными иконками
class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        mapView.register(AnnotationPinView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier)
        // Do any additional setup after loading the view, typically from a nib.
        
    
        let firstLoc = CLLocationCoordinate2DMake(34.943705, 33.583589)
        // Создаем заколку
        let dropPin = AnnotationPin(coordinate: firstLoc, pinName: "AAA", pinAddress: "DDDX", pinPhone: "2434", pinImage: #imageLiteral(resourceName: "pin"), pintype: .parking)
        
        self.mapView.addAnnotation(dropPin)

        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
    typealias MapViewDelegate = ViewController
    extension MapViewDelegate
    {

        func mapView(_ mapView: MKMapView,
                     didSelect view: MKAnnotationView)
        {
            // 1
            if view.annotation is MKUserLocation
            {
                // Don't proceed with custom callout
                return
            }
            // 2
            let starbucksAnnotation = view.annotation as! AnnotationPin
            let views = Bundle.main.loadNibNamed("CalloutView", owner: nil, options: nil)
            let calloutView = views?[0] as! CalloutViewController
            calloutView.title.text = starbucksAnnotation.name
            calloutView.subtitle.text = starbucksAnnotation.address
            calloutView.type.text = starbucksAnnotation.phone
            calloutView.image.image = starbucksAnnotation.image
         
            // 3
            calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
            view.addSubview(calloutView)
            mapView.setCenter((view.annotation?.coordinate)!, animated: true)
        }
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            if view.isKind(of: CalloutAnnotationView.self)
            {
                for subview in view.subviews
                {
                    subview.removeFromSuperview()
                }
            }
        }

}
