//
//  Location.swift
//  weather
//
//  Created by Abdalla on 7/30/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import Foundation
import CoreLocation

class Location{
    
    static var shareInstances = Location()
    private init() {}
    
    var lat = 0.0
    var lon = 0.0
}
