//
//  ViewController.swift
//  weatherapp
//
//  Created by wuhuaicheng on 23/11/2018.
//  Copyright © 2018 wuhuaicheng. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

class ViewController: UIViewController,CLLocationManagerDelegate {
    let locationManager:CLLocationManager = CLLocationManager()

    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations[locations.count-1]
        if(location.horizontalAccuracy > 0) {
            print(location.coordinate.latitude)
            print(location.coordinate.longitude)
            self.updateWeatherInfo(latitude: location.coordinate.latitude,
                                   longitude: location.coordinate.longitude,
                                   appid: "4f4be8fe7031dddd5dec789e01c1b3ac")}}
            func updateWeatherInfo(latitude: CLLocationDegrees,
                                   longitude: CLLocationDegrees, appid: String) {

        let url = "https://api.openweathermap.org/data/2.5/weather"
        
        let params = ["lat": latitude,
                      "lon": longitude,
                      "appid": appid,
                      "cnt": 0] as [String : Any]
        
                Alamofire.request(url, parameters : params).responseObject { (response:DataResponse<BaseModel>) in
                    let BaseModel = response.result.value
                    if let wea = BaseModel?.weather{
                    for WeatherModel in wea {
                    
                    let w = WeatherModel.description!
                      self.weather.text = w                        }}
                        if let mai = BaseModel?.main{
                            if let tem1 = mai.temp{
                        let tem2 = round(tem1 - 273.15)
                           self.temperature.text = "\(tem2)"
                            }
    
                        }
                  
    
                }}}
