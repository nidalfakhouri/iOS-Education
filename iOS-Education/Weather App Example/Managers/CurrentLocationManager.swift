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
    func didFailWithError(error: Error)
}

class CurrentLocationManager: NSObject {
    
    public static let shared = CurrentLocationManager()
    public private(set) var lastLocationFix: CLLocation? // makes it readonly externally, but can still write internally
    fileprivate let locationManager = CLLocationManager()
    fileprivate var delegate: CurrentLocationManagerDelegate?
    
    override public init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.distanceFilter = 50.0
        // dont forget to add a usage description
        // https://developer.apple.com/documentation/corelocation/choosing_the_authorization_level_for_location_services/requesting_always_authorization
    }
    
    public func requestLocationWithDelegate(_ delegate: CurrentLocationManagerDelegate?) {
        self.delegate = delegate
        
        if let location = self.lastLocationFix {
            self.delegate?.didUpdateLocation(location: location)
        }

        requestLocation()
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
        delegate?.didFailWithError(error: error)
    }
}
