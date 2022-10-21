//
//  Weather.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import Foundation


struct Weather: Equatable {

    static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.id == rhs.id
    }

    var id: String?
    var main: String?
    var icon: String?
    var name: String?
    var lat: Double?
    var lon: Double?
    var country: String?

    init() {

    }

    init(id: String,
         main: String,
         icon: String,
         name: String,
         lat: Double,
         lon: Double,
         country: String,
    ) {
        self.id: String
        self.main: String
        self.icon: String
        self.name: String
        self.lat: Double
        self.lon: Double
        self.country: String
    }

    init(object: [String: Any]) {
        id = String.pjs(object["id"])
        main = String.pjs(object["main"])
        name = String.pjs(object["name"])
        lat = String.pjs(object["lat"])
        lon = String.pjs(object["lon"])
        country = String.pjs(object["country"])
        
        if let icon = object["icon"] {
            self.icon = String.pjs(icon)
        }
    }

    func getJSONforCreating() -> String {
        var nameArrWeather = [String: Any]()
        nameArrWeather["id"] = id
        nameArrWeather["main"] = main
        nameArrWeather["icon"] = icon
        nameArrWeather["name"] = name
        nameArrWeather["lat"] = lat
        nameArrWeather["lon"] = lon
        nameArrWeather["country"] = country

        return DataHelper.dictionaryToJson(dict: nameArrWeather)
    }
    
    func getJSONforUpdating() -> String {
        var nameArrWeather = [String: Any]()
        nameArrWeather["id"] = id
        nameArrWeather["main"] = main
        nameArrWeather["icon"] = icon
        nameArrWeather["name"] = name
        nameArrWeather["lat"] = lat
        nameArrWeather["lon"] = lon
        nameArrWeather["country"] = country
        
        print("name \(nameArrWeather)")

        return DataHelper.dictionaryToJson(dict: nameArrWeather)
    }
    
}
