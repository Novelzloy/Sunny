//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by Ivan Akulov on 28/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import Foundation

struct NetworkWeatherManager {
    func featchCurrentWetherManager(forCity city: String){
        let urlSrting = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlSrting) else {return}
            let sesion = URLSession(configuration: .default)
            let task = sesion.dataTask(with: url) { data, reponce, error in
                if let data = data{
                    let dataString = String(data: data, encoding: .utf8)
                    print(dataString!)
                }
            }
            task.resume()
    }
}
