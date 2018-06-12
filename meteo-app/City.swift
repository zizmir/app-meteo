//
//  City.swift
//  meteo-app
//
//  Created by Bouznir on 10/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON
class City: NSObject {
    var name:String
    var coordinates: CLLocationCoordinate2D
    var urlIconWheather:String = ""
    var temperature:Float = 0
    var currentSummary:String = ""
    var strengtHOfWild:Int = 0
    var pressure:Float = 0
    var moisture:Float = 0
    var uvIndex:Int = 0
    var hourlyForecast:String = ""
    var dailyForecast:String = ""
    var tupleHourly:[(Int,String,Float, Float)] = []
    var tupleDaily:[(Int,String,Float, Float)] = []
    
    init( name : String ,  coordinates : CLLocationCoordinate2D) {
        self.name = name
        self.coordinates = coordinates
    }
    func update( _ json : JSON ){
        let currently = json["currently"]
        let hourly = json["hourly"]
        let daily = json["daily"]
        self.urlIconWheather = currently["icon"].stringValue
        self.temperature = currently["temperature"].floatValue
        self.currentSummary = currently["summary"].stringValue
        self.strengtHOfWild = currently["windSpeed"].intValue
        self.pressure = currently["pressure"].floatValue
        self.moisture = currently["humidity"].floatValue
        self.uvIndex = currently["uvIndex"].intValue
        self.hourlyForecast = hourly["summary"].stringValue
        
        self.dailyForecast = daily["summary"].stringValue
      

        for index in hourly["data"].arrayValue {
            
            self.tupleHourly.append(
                (
                    index["time"].intValue ,
                    index["icon"].stringValue,
                    index["humidity"].floatValue,
                    index["temperature"].floatValue
                )
            )
        }
        for index in daily["data"].arrayValue {
            self.tupleDaily.append(
                (
                    index["time"].intValue ,
                    index["icon"].stringValue,
                    index["temperatureMin"].floatValue,
                    index["temperatureMax"].floatValue
                )
            )
        }
    }
}
