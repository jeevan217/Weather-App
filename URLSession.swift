//
//  URLSession.swift
//  What's The Weather
//
//  Created by Jeevan Kaderiya on 12/10/2024.
//

import Foundation

class WeatherManager {
    let apiKey = "52dace094bfd1967dc660fa9de387464"
    
    func fetchWeather(city: String, completion: @escaping (WeatherData?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let weatherData = try decoder.decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        completion(weatherData)
                    }
                } catch {
                    print("Error decoding: \(error)")
                    completion(nil)
                }
            }
        }.resume()
    }
}

