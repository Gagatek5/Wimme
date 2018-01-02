//
//  MapVC.swift
//  Wimme
//
//  Created by Tom on 19/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class MapVC: UIViewController,UITextFieldDelegate, CLLocationManagerDelegate, GMSAutocompleteResultsViewControllerDelegate {

    var Category = ""
    var Subcategory = ""

    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    var alert: UIAlertController?
    var myplace:String?
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //hiding keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }

        
        // Update the map once the user has made their selection.
        @IBAction func unwindToMain(segue: UIStoryboardSegue) {
            // Clear the map.
            mapView.clear()
            
            // Add a marker to the map.
            if selectedPlace != nil {
                let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
                marker.title = selectedPlace?.name
                marker.snippet = selectedPlace?.formattedAddress
                marker.map = mapView
            }
            
            listLikelyPlaces()
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Initialize the location manager.
            locationManager = CLLocationManager()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.distanceFilter = 50
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
            
            placesClient = GMSPlacesClient.shared()
            
            // Create a map.
            let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                                  longitude: defaultLocation.coordinate.longitude,
                                                  zoom: zoomLevel)
            mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
            mapView.settings.myLocationButton = true
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            mapView.isMyLocationEnabled = true
            
            
            do {
                // Set the map style by passing the URL of the local file.
                if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                    mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                } else {
                    NSLog("Unable to find style.json")
                }
            } catch {
                NSLog("One or more of the map styles failed to load. \(error)")
            }
            
            
            // Add the map to the view, hide it until we&#39;ve got a location update.
            view.addSubview(mapView)
            mapView.isHidden = true
            
            listLikelyPlaces()
            
            resultsViewController = GMSAutocompleteResultsViewController()
            resultsViewController?.delegate = self
            
            searchController = UISearchController(searchResultsController: resultsViewController)
            searchController?.searchResultsUpdater = resultsViewController
            
            // Put the search bar in the navigation bar.
            searchController?.searchBar.sizeToFit()
            navigationItem.titleView = searchController?.searchBar
            
            // When UISearchController presents the results view, present it in
            // this view controller, not one further up the chain.
            definesPresentationContext = true
            
            // Prevent the navigation bar from being hidden when searching.
            searchController?.hidesNavigationBarDuringPresentation = false
            
            let screensize = UIScreen.main.bounds
            let button = UIButton()
            button.frame = CGRect(x: screensize.width*0.65, y: screensize.height*0.915, width: 50, height: 50)
            button.backgroundColor = UIColor.cyan
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.view.addSubview(button)
            
        }
        @objc func buttonAction(_ sender: Any) {

            var place: String
            var coordinateX: Float
            var coordinateY: Float
            var coordinateZ: Float
            
            if selectedPlace != nil {
                place = (selectedPlace?.name)!
                coordinateX = Float((selectedPlace?.coordinate.longitude)!)
                coordinateY = Float((selectedPlace?.coordinate.latitude)!)
                coordinateZ = 0
                print("\(place), \(coordinateX), \(coordinateY), \(coordinateZ)")
                
                performSegue(withIdentifier: "addEvent", sender: sender)
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addEvent" {
            let create: CreateEvent = segue.destination as! CreateEvent
            
            create.Category = Category
            create.Subcategory =  Subcategory
            create.place = (selectedPlace?.name)!
            create.coordinateX = Float((selectedPlace?.coordinate.longitude)!)
            create.coordinateY = Float((selectedPlace?.coordinate.latitude)!)
            create.coordinateZ = 0
        }
    }
    
        // Populate the array with the list of likely places.
        func listLikelyPlaces() {
            // Clean up from previous sessions.
            likelyPlaces.removeAll()
            
            placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
                if let error = error {
                    // TODO: Handle the error.
                    print("Current Place error: \(error.localizedDescription)")
                    return
                }
                
                // Get likely places and add to the list.
                if let likelihoodList = placeLikelihoods {
                    for likelihood in likelihoodList.likelihoods {
                        let place = likelihood.place
                        self.likelyPlaces.append(place)
                    }
                }
            })
        }
        
        // Add a UIButton in Interface Builder, and connect the action to this function.
        @IBAction func getCurrentPlace(_ sender: UIButton) {
            
            placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
                if let error = error {
                    print("Pick Place error: \(error.localizedDescription)")
                    return
                }
                
                self.nameLabel.text = "No current place"
                self.addressLabel.text = ""
                
                if let placeLikelihoodList = placeLikelihoodList {
                    let place = placeLikelihoodList.likelihoods.first?.place
                    if let place = place {
                        self.nameLabel.text = place.name
                        self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ")
                            .joined(separator: "\n")
                    }
                }
            })
        }
        



        
        // Handle incoming location events.
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location: CLLocation = locations.last!
            print("Location: \(location)")
            
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: zoomLevel)
            
            if mapView.isHidden {
                mapView.isHidden = false
                mapView.camera = camera
            } else {
                mapView.animate(to: camera)
            }
            
            listLikelyPlaces()
        }
        
        // Handle authorization for the location manager.
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .restricted:
                print("Location access was restricted.")
            case .denied:
                print("User denied access to location.")
                // Display the map using the default location.
                mapView.isHidden = false
            case .notDetermined:
                print("Location status not determined.")
            case .authorizedAlways: fallthrough
            case .authorizedWhenInUse:
                print("Location status is OK.")
            }
        }
        
        // Handle location manager errors.
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            locationManager.stopUpdatingLocation()
            print("Error: \(error)")
        }
    
    

        func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
            
        }
        
        func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                               didAutocompleteWith place: GMSPlace) {
            searchController?.isActive = false
            // Do something with the selected place.
            print("Place name: \(place.name)")
            print("Place address: \(String(describing: place.formattedAddress))")
            print("Place coordinates: \(String(describing: place.coordinate))")
            selectedPlace = place
            //dismiss(animated: true, completion: nil)
            
            // Clear the map.
            mapView.clear()
            
            // Add a marker to the map.
            if selectedPlace != nil {
                let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
                marker.title = selectedPlace?.name
                marker.snippet = selectedPlace?.formattedAddress
                marker.map = mapView
                
                let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude,
                                                      longitude: place.coordinate.longitude,
                                                      zoom: zoomLevel)
                mapView.camera = camera
                
            }
            
            listLikelyPlaces()
            
        }
        func resultsController(resultsController: GMSAutocompleteResultsViewController!,
                               didFailAutocompleteWithError error: Error!){
            // TODO: handle the error.
            print("Error: ", error)
        }
        
        // User canceled the operation.
        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            dismiss(animated: true, completion: nil)
        }
        
        // Turn the network activity indicator on and off again.
        func didRequestAutocompletePredictionsForResultsController(resultsController: GMSAutocompleteResultsViewController!) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        func didUpdateAutocompletePredictionsForResultsController(resultsController: GMSAutocompleteResultsViewController!) {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
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
