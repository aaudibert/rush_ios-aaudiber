//
//  FirstViewController.swift
//  iDidit
//
//  Created by swift on 20/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController, MKMapViewDelegate{
    
   
    @IBOutlet var viewMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        var lat:CLLocationDegrees  = 48.896771
        var long:CLLocationDegrees = 2.318392
        
        var latDelta:CLLocationDegrees  = 0.0001
        var longDelta:CLLocationDegrees = 0.0001
        
        var span:MKCoordinateSpan        = MKCoordinateSpanMake(latDelta, longDelta)
        var ecole:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        var eregion:MKCoordinateRegion   = MKCoordinateRegionMake(ecole, span)

        self.viewMap.setRegion(eregion, animated: true)
        
        var ecoleAnnotation = MKPointAnnotation()
        ecoleAnnotation.coordinate = ecole
        ecoleAnnotation.title    = "Ecole 42"
        ecoleAnnotation.subtitle = "Ecole d'informatique et de ctrl+c/ctrl+v"
        
        self.viewMap.addAnnotation(ecoleAnnotation)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

