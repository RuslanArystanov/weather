//
//  DataManager.swift
//  weather
//
//  Created by Руслан Арыстанов on 23.12.2024.
//

class DataManager {
    static let share = DataManager()
    var weatherCityes: [Weather] = []
    let latitudes = [
        "Nur-Sultan": 51.169392,
        "Almaty": 43.238949,
        "Shymkent": 42.341675,
        "Karaganda": 49.804684,
        "Aktobe": 50.283937,
        "Pavlodar": 52.287204,
        "Taraz": 42.899998,
        "Ust-Kamenogorsk": 49.948235,
        "Semey": 50.426761,
        "Atyrau": 47.094495,
        "Kostanay": 53.214377,
        "Kyzylorda": 44.848831,
        "Aktau": 43.648056,
        "Petropavl": 54.875294,
        "Oral": 51.227778,
        "Taldykorgan": 45.015606,
        "Zhanaozen": 43.303099
    ]
    let longitudes = [
        "Nur-Sultan": 71.428627,
        "Almaty": 76.889709,
        "Shymkent": 69.596329,
        "Karaganda": 73.096876,
        "Aktobe": 57.167045,
        "Pavlodar": 76.949379,
        "Taraz": 71.366669,
        "Ust-Kamenogorsk": 82.611940,
        "Semey": 80.260819,
        "Atyrau": 51.923528,
        "Kostanay": 63.632511,
        "Kyzylorda": 65.504959,
        "Aktau": 51.168056,
        "Petropavl": 69.142391,
        "Oral": 51.366667,
        "Taldykorgan": 78.400612,
        "Zhanaozen": 52.866777
    ]
    
    func getWeatherForecast(){
        for (latitude, longitude) in zip(latitudes, longitudes) {
            NetworkManager.share.fetchWeatherData(for: latitude.value, and: longitude.value)
        }
    }
    private init (){}
}
