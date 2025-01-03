//
//  NetworkManager.swift
//  weather
//
//  Created by Руслан Арыстанов on 22.12.2024.
//

import Foundation

class NetworkManager {
    static let share = NetworkManager()
    
    func fetchWeatherData(for city: String) async throws -> Weather {
        let url = URL(string: "https://weatherapi-com.p.rapidapi.com/current.json?q=\(city)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("70fba26967msh5646de48cc60431p1d6e05jsnc7997dcea1cf", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("weatherapi-com.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        return weather
    }
    
    private init(){}
}
