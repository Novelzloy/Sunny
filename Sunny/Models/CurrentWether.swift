//
//  CurrentWether.swift
//  Sunny
//
//  Created by Роман on 10.08.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import Foundation

struct CurrentWether {
    let cityName: String
    let temperature: Double
    
    var tempeartureString: String{
        return "\(temperature.rounded())"
    }
    
    let feelsLikeTemperature: Double
    
    var feelsLikeTemperatereString: String{
        return "\(feelsLikeTemperature.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData:CurrentWetherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}
