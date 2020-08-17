//
//  weather.swift
//  WeatherApp
//
//  Created by tantsunsin on 2020/8/14.
//

import Foundation

struct WeatherObject: Codable{
    var current : current?
    
    struct current: Codable {
        var temp : Double?
        var feels_like : Double?
        var humidity : Double?
        var wind_speed : Double?

        var weather : [currentweather]
        
        struct currentweather: Codable {
            var main : String?
            var description : String?
        }
        
    }
    
    var hourly : [hour]
    
    struct hour : Codable {
        var temp : Double?
        var humidity :Int?
        
        var weather : [hourlyweather]
        
        struct hourlyweather : Codable {
            var main : String?
            var description : String?
            var icon : String?
        }
    }
}

struct City {
    var CityNameZHTW : String
    var CityNameEN : String
    var GeoCor : String
    var WeatherOfCity : WeatherObject?
}

var CityWeather : [City] = [City(CityNameZHTW: "台北市", CityNameEN: "Taipei City", GeoCor: "lat=25.105497&lon=121.597366", WeatherOfCity: nil), City(CityNameZHTW: "台中市", CityNameEN: "Taichung City", GeoCor: "lat=24.147736&lon=120.673645", WeatherOfCity: nil), City(CityNameZHTW: "高雄市", CityNameEN: "Kaohshiung City", GeoCor: "lat=22.633333&lon=120.266667", WeatherOfCity: nil)]
