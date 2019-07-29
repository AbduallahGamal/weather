//
//  currentWeather.swift
//  weather
//
//  Created by Abdalla on 7/29/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import Foundation
import Alamofire
class currentWeather{
    
    var cityName:String!
    var date: String!
    var currentTemp = 0
    var weatherType: String!
    
    func downloadweatherdetails(completed:@escaping downloadComplete){
        Alamofire.request(MAIN_URL).responseJSON{(response) in
            let result = response.result
            
            if let dict = result.value as? [String:Any]{
                if let name = dict["name"] as? String{
                    self.cityName = name.capitalized
                }
                if let main = dict["main"] as? [String:Any]{
                    if let temp = main["temp"] as? Double{
                        self.currentTemp = Int(temp-273.15)
                    }
                    
                    if let weather = dict["weather"] as? [[String: Any]]{
                        if let main = weather[0]["main"] as? String{
                            self.weatherType = main
                        }
                    }
                }

            }
            completed()
        }
            
    }
}
