//
//  WeatherResponse.swift
//  CP4a
//
//  Created by Sahil Shah on 15/09/2015.
//  Copyright © 2015 Sahil Shah. All rights reserved.
//

import Foundation

import ObjectMapper
import AlamofireObjectMapper



class WeatherResponse: Mappable {
    var stringLocation: String?
    var threeDayForecast: [Forecast]?
    // var location: [Location]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        stringLocation <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
        //  location <- map["location"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(_ map: Map){}
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}

class Location: Mappable {
    var location: String?
    
    required init?(_ map: Map){}
    
    func mapping(map: Map) {
        location <- map["location"]
    }
}