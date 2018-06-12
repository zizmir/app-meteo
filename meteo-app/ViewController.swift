//
//  ViewController.swift
//  meteo-app
//
//  Created by Bouznir on 10/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit

import MapKit

class ViewController: UIViewController , MKMapViewDelegate{
    @IBOutlet var mapView : MKMapView!
    var currentCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        var coordinates: [CLLocationCoordinate2D] = []
        
        for city in CitiesData.list {
            coordinates.append(city.coordinates)
        }
        for coordinate in CitiesData.list {
            let pin = MKPointAnnotation()
            pin.coordinate = coordinate.coordinates
            pin.title = coordinate.name
            mapView.addAnnotation(pin)
        }
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        

        currentCity = City(name: (((view.annotation?.title)!))!, coordinates: (view.annotation?.coordinate)!)

        performSegue(withIdentifier: "detailsSegue", sender: self)

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let target = segue.destination as? DetailsCoordinateViewController {
            target.city = currentCity
        }


    }

}

