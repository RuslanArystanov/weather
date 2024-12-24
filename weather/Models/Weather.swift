//
//  Weather.swift
//  weather
//
//  Created by Руслан Арыстанов on 20.12.2024.
//

struct Weather: Decodable {
    let location: Location
    let current: Current
    
    struct Location: Decodable {
        let country: String
        let region: String
    }
    
    struct Current: Decodable {
        let condition: Condition
        let temp_c: Double
        let feelslike_c: Double
        let humidity: Int
        let precip_mm: Double
        let wind_kph: Double
        let wind_dir: String
        let pressure_mb: Double
        let is_day: Int
        let vis_km: Int
        
        struct Condition: Decodable {
            let text: String
            let code: Int
        }
    }
}
