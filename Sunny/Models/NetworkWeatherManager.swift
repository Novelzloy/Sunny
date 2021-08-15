//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by Ivan Akulov on 28/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func updateInterfase(_ :NetworkWeatherManager ,with currentWether: CurrentWether)
}

class NetworkWeatherManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    func featchCurrentWetherManager(forCity city: String){
        let urlSrting = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlSrting) else {return}
            let sesion = URLSession(configuration: .default)
            let task = sesion.dataTask(with: url) { data, reponce, error in
                if let data = data{
                    if let curentWether = self.parseJSON(withData: data){       
                        self.delegate?.updateInterfase(self, with: curentWether)
                    }
                }
            }
            task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWether? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWetherData.self, from: data)
            guard let currentWhether = CurrentWether(currentWeatherData: currentWeatherData) else {return nil}
            return currentWhether
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

