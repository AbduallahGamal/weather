//
//  constant.swift
//  weather
//
//  Created by Abdalla on 7/29/19.
//  Copyright © 2019 edu.data. All rights reserved.
//
import Foundation
typealias downloadComplete = () -> ()

let MAIN_URL1 = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"

let MAIN_URL = "https://samples.openweathermap.org/data/2.5/weather?lat=\(Location.shareInstances.lat)&lon=\(Location.shareInstances.lon)&appid=bed76a96052519cd51a5b291cdd974c2"

let FORECAST_URL = "https://samples.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.shareInstances.lat)&lon=\(Location.shareInstances.lon)&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"
