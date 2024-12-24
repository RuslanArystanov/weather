//
//  NetworkManager.swift
//  weather
//
//  Created by Руслан Арыстанов on 22.12.2024.
//

import Foundation

class NetworkManager {
    static let share = NetworkManager()
    
    func fetchWeatherData(for latitude: Double, and longitude: Double) {
        let url = URL(string: "https://weatherapi-com.p.rapidapi.com/current.json?q=\(latitude)%\(longitude)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("70fba26967msh5646de48cc60431p1d6e05jsnc7997dcea1cf", forHTTPHeaderField: "x-rapidapi-key")
        request.setValue("weatherapi-com.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        
        URLSession.shared.dataTask(with: request) { Data, _, Error in
            guard let data = Data else {
                print(Error?.localizedDescription ?? "Неизвестная ошибка")
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                print(weather)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private init(){}
}
