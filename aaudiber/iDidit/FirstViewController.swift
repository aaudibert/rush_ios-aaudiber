//
//  FirstViewController.swift
//  iDidit
//
//  Created by swift on 20/12/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
   
    @IBOutlet var viewMap: MKMapView!
    @IBOutlet var myLoc: UIButton!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var lat:CLLocationDegrees  = 48.896771
        var long:CLLocationDegrees = 2.318392
        
        var latDelta:CLLocationDegrees  = 0.0001
        var longDelta:CLLocationDegrees = 0.0001
        
        var spanito:MKCoordinateSpan        = MKCoordinateSpanMake(latDelta, longDelta)
        var ecole:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        var eregion:MKCoordinateRegion   = MKCoordinateRegionMake(ecole, spanito)

        self.viewMap.setRegion(eregion, animated:true)
        
        var ecoleAnnotation = MKPointAnnotation()
        ecoleAnnotation.coordinate = ecole
        ecoleAnnotation.title    = "Ecole 42"
        ecoleAnnotation.subtitle = "Ecole d'informatique et de ctrl+c/ctrl+v"
        
        self.viewMap.addAnnotation(ecoleAnnotation)
        
        viewMap.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        let authstate = CLLocationManager.authorizationStatus()
        if(authstate == CLAuthorizationStatus.NotDetermined){  // Gestion de l'authorisation
            println("Not Authorized")
            manager.requestWhenInUseAuthorization()
        }
        manager.startUpdatingLocation()
        viewMap.showsUserLocation = true
        
        }
    

    @IBAction func typeSwitch(sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
            case 0:
            self.viewMap.mapType = MKMapType.Standard;
            break;
            case 1:
            self.viewMap.mapType = MKMapType.Satellite;
            break;
            case 2:
            self.viewMap.mapType = MKMapType.Hybrid;
            break;
            default:
            self.viewMap.mapType = MKMapType.Standard;
            break;
        }
    }

    @IBAction func myLocation(sender: AnyObject) {
        /*let spanX = 0.007
        let spanY = 0.007
        
        var newRegion = MKCoordinateRegion(center: viewMap.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        viewMap.setRegion(newRegion, animated: true)*/
        self.manager.requestAlwaysAuthorization()
        self.manager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            self.manager.delegate = self
            self.manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.manager.requestAlwaysAuthorization()
            self.manager.startUpdatingLocation()
        }
        viewMap.showsUserLocation = true
        
        var latitude:CLLocationDegrees = viewMap.userLocation.coordinate.latitude
        var longitude:CLLocationDegrees = viewMap.userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.0015
        var longDelta:CLLocationDegrees = 0.0015
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.viewMap.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

