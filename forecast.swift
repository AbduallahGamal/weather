//
//  ForeCast.swift
//  weather
//
//  Created by Abdalla on 7/29/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import Foundation
class ForeCast {
    
    var date:String!
    var weatherType:String!
    var highTemp = ""
    var lowTemp = ""
    
    init(weatherDict: [String : Any]) {
        
        if let weather = weatherDict["weather"] as? [[String:Any]]{
            if let main = weather[0]["main"] as? String{
                self.weatherType = main
            }
        }
        if let temp = weatherDict["temp"] as? [String:Any]{
            if let min = temp["min"] as? Double{
                self.lowTemp = "\(Int(min - 273.15))"
            }
            if let max = temp["max"] as? Double{
                self.highTemp = "\(Int(max - 273.15))"
            }
        }
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self.date = unixConvertedDate.dayOfTheWeek()
        }
    }
}

extension Date{
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
