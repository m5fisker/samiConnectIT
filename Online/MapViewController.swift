//
//  MapViewController.swift
//  Online
//
//  Created by Kumar Soorya on 7/25/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var Mapfunc: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let location = CLLocationCoordinate2DMake(25.094944, 55.155003)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title="SAP"
        
        Mapfunc.addAnnotation(annotation)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
