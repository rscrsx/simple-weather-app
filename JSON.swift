//
//  JSON.swift
//  weatherapp
//
//  Created by wuhuaicheng on 25/11/2018.
//  Copyright © 2018 wuhuaicheng. All rights reserved.
//

import Foundation
import ObjectMapper
struct BaseModel: Mappable {
    var coord: CoordModel!
    var weather: [WeatherModel]!
    var base: String!
    var main: MainModel!
    var visibility: Int!
    var wind: WindModel!
    var clouds: CloudsModel!
    var dt: Int!
    var sys: SysModel!
    var id: Int!
    var name: String!
    var cod: Int!
    
    
    init?(map: Map) {
    
    }
    mutating func mapping(map: Map) {
        coord <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        sys <- map["sys"]
        id <- map["id"]
        name <- map["wind"]
        cod <- map["cod"]    }    }
struct CoordModel: Mappable{
    var lon:Double!
    var lat:Double!
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        lon <- map["lon"]
        lat <- map["lat"]
    }}
struct WeatherModel: Mappable{
    init?(map: Map) {
    }
    var weatherid:Int!
    var weathermain:String!
    var description:String!
    var icon:String!
    mutating func mapping(map: Map) {
        weatherid <- map["id"]
        weathermain <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
        
    }
        
    }
struct MainModel:Mappable  {
    
    var temp: Double!
    var pressure: Int!
    var humidity: Int!
    var tempmin:Double!
    var tempmax:Double!
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
       temp <- map["temp"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        tempmin <- map["temp_min"]
        tempmax <- map["temp_max"]
    }
}
struct WindModel: Mappable {
    var speed: Double!
    var deg: Int!
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }}
struct CloudsModel: Mappable {
        var all:Int!
        init?(map: Map) {
            
        }
        mutating func mapping(map: Map) {
            all <- map["all"]
        }
    }
struct SysModel: Mappable {
        var type:Int!
        var sysid:Int!
        var message:Double!
        var country:String!
        var sunrise:Int!
        var sunset:Int!
        init?(map: Map) {
            
        }
        mutating func mapping(map: Map) {
            type <- map["type"]
             sysid <- map["id"]
             message <- map["message"]
             country <- map["country"]
             sunrise <- map["sunrise"]
             sunset <- map["sunset"]        }
        
    }

        
        





