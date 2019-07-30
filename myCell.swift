//
//  myCell.swift
//  weather
//
//  Created by Abdalla on 7/29/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDay: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!

    func configurationCell(forecast: ForeCast){
        minTemp.text = "\(forecast.lowTemp)"
        maxTemp.text = "\(forecast.highTemp)"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        weatherDay.text = forecast.date
    }
}
