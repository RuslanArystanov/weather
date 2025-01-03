//
//  DataManager.swift
//  weather
//
//  Created by Руслан Арыстанов on 23.12.2024.
//

class DataManager {
    static let share = DataManager()

    let citiesKazakhstan = [
        "Astana",        // Астана
        "Almaty",        // Алматы
        "Shymkent",      // Шымкент
        "Qaragandy",     // Қарағанды
        "Aqtóbe",        // Ақтөбе
        "Taraz",         // Тараз
        "Pavlodar",      // Павлодар
        "Semei",         // Семей
        "Óskemen",       // Өскемен
        "Oral",          // Орал
        "Qostanai",      // Қостанай
        "Qyzylorda",     // Қызылорда
        "Atyraý",        // Атырау
        "Aqtaý",         // Ақтау
        "Taldyqorǵan",   // Талдықорған
        "Kókshetaý",     // Көкшетау
        "Ekibastuz",     // Екібастұз
        "Zhanaozen",     // Жаңаөзен
        "Turkistan",     // Түркістан
        "Balkhash",      // Балқаш
        "Baıqońyr",      // Байқоңыр
        "Jezqazǵan",     // Жезқазған
        "Rudny",         // Рудный
        "Temirtaý",      // Теміртау
        "Kyzylorda",     // Кызылорда
        "Petropavl",     // Петропавл
        "Aktau",         // Актау
        "Aktobe",        // Актобе
        "Kostanay",      // Костанай
        "Kokshetau",     // Кокшетау
        "Taldykorgan",   // Талдыкорган
        "Oral",          // Уральск
        "Oskemen",       // Усть-Каменогорск
        "Semey",         // Семей
        "Shymkent",      // Шымкент
        "Taraz",         // Тараз
        "Turkistan"      // Туркестан
    ]
    
    func getWeatherForecast() async -> [Weather] {
        var weatherCities: [Weather] = []

        for city in citiesKazakhstan {
            do {
                let weather = try await NetworkManager.share.fetchWeatherData(for: city)
                weatherCities.append(weather)
            } catch {
                print("ошибка: \(error)")
            }
        }

        return weatherCities
    }

    
    private init (){}
}
