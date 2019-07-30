//
//  ViewController.swift
//  weather
//
//  Created by Abdalla on 7/29/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    //Mark:- IBOUTLET
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempTypeLabel: UILabel!
    @IBOutlet weak var imgTemp: UIImageView!
    
    
    //Mark:- VARIABLES
    var cw = currentWeather()
    var arrForecasts = [ForeCast]()
    
    var lm = CLLocationManager()
    var cl = CLLocation()
    
    
    //Mark:- FUNCTION
        override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.requestWhenInUseAuthorization()
        lm.startMonitoringSignificantLocationChanges()
        
        }
    
        func dateUpdate(){
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .long
            let currentDate = dateFormatter.string(from: Date())
            self.dateLabel.text = currentDate
        }
    
        func updateUI(){
            locationLabel.text = self.cw.cityName
            tempLabel.text = "\(self.cw.currentTemp)"
            tempTypeLabel.text = self.cw.weatherType
            imgTemp.image = UIImage(named: cw.weatherType)
        }
    
        func downloadForecastData(completed:@escaping downloadComplete){
            Alamofire.request(FORECAST_URL).responseJSON{(response) in
            let result = response.result
            
            if let dict = result.value as? [String:Any]{
                if let list = dict["list"] as? [[String:Any]]{
                    for obj in list {
                    let fr = ForeCast(weatherDict: obj)
                    self.arrForecasts.append(fr)
                    print(obj)
                    }
                }
                self.table.reloadData()
            }
            completed()
        }
    }
            
    override func viewDidAppear(_ animated: Bool){
                super.viewDidAppear(true)
                locationAuthStatus()
            }
            
        func locationAuthStatus(){
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
                cl = lm.location!
                Location.shareInstances.lat = cl.coordinate.latitude
                Location.shareInstances.lon = cl.coordinate.longitude
                cw.downloadweatherdetails {
                    self.downloadForecastData {
                        self.dateUpdate()
                        self.updateUI()
                    }
                }
                
            } else{
                lm.requestWhenInUseAuthorization()
                locationAuthStatus()
            }
        }

}

//Mark:- Extension

extension  ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myCell{
            
            let list = arrForecasts[indexPath.row]
            cell.configurationCell(forecast: list)
            return cell
        }else{
            return myCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrForecasts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

