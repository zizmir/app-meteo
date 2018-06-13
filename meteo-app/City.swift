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
    var hourlyForecast:String = ""
    var dailyForecast:String = ""
    var tupleHourly:[(Int,String,Float, Float)] = []
    var tupleDaily:[(Int,String,Float, Float)] = []
    var tupleExtraInformations: [(Int , String , Int , String )] = []
    
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
        

        self.hourlyForecast = hourly["summary"].stringValue
        self.dailyForecast = daily["summary"].stringValue
        self.tupleExtraInformations.append((Int(currently["humidity"].floatValue * 100 ) , "Humidity", Int(currently["windSpeed"].floatValue), "Wind speed"))
        self.tupleExtraInformations.append(( currently["pressure"].intValue, "Pressure" ,currently["uvIndex"].intValue , "UV Index"))

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
