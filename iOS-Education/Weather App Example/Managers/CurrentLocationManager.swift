//
//  CurrentLocationManager.swift
//  iOS-Education
//
//  Created by Nidal Fakhouri on 6/1/18.
//  Copyright © 2018 Nidal Fakhouri. All rights reserved.
//

import Foundation
import CoreLocation

protocol CurrentLocationManagerDelegate {
    func didUpdateLocation(location: CLLocation)
}

class CurrentLocationManager: NSObject {
    
    public static let shared = CurrentLocationManager()
    fileprivate let locationManager = CLLocationManager()
    public private(set) var lastLocationFix: CLLocation? // makes it readonly externally, but can still write internally
    
    // use the didset method to allow the delegate to report the last fix if we have re assigned the delegate
    public var delegate: CurrentLocationManagerDelegate? {
        didSet {
            if let location = self.lastLocationFix {
                delegate?.didUpdateLocation(location: location)
            }
            
            requestLocation()
        }
    }
    
    override public init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.distanceFilter = 50.0
        // dont forget to add a usage description
        // https://developer.apple.com/documentation/corelocation/choosing_the_authorization_level_for_location_services/requesting_always_authorization
    }
    
    public func requestLocation() {
        locationManager.requestLocation()
    }
}

extension CurrentLocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // most recent location
        if let location = locations.last, location != lastLocationFix {
            lastLocationFix = location
            delegate?.didUpdateLocation(location: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
