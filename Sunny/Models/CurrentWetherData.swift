//
//  CurrentWetherData.swift
//  Sunny
//
//  Created by Роман on 08.08.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//

import Foundation


struct CurrentWetherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey{
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
    let main: String
}
