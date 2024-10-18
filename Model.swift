//
//  Model.swift
//  What's The Weather
//
//  Created by Jeevan Kaderiya on 12/10/2024.
//

import Foundation

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let icon: String
}

