//
//  DB.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import Foundation

//MARK: NameSettings

static func setNameSettings(name: NewViewName) {
    let entity = NSEntityDescription.entity(forEntityName: "NameSettingsData", in: managedContext)!
    let record = NSManagedObject(entity: entity, insertInto: managedContext)
    
    record.setValue(name.name, forKey: "name")
    record.setValue(name.id, forKey: "id")
    
    do {
        try managedContext.save()
        print("setUserProfileSettings Record Added! \(record.value(forKey: "id"))")
    } catch let error as NSError{
        print("setUserProfileSettings Could not save. \(error),\(error.userInfo)")
    }
}

static func updateNameSettings(name: NewViewName) {
    let predicate = NSPredicate(format: "id = %@", name.id ?? "")
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"NameSettingsData")
    fetchRequest.predicate = predicate
    
    var items:[NSManagedObject] = [NSManagedObject]()
    do {
        items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
        
        items.forEach { record in
            record.setValue(name.name, forKey: "name")
            record.setValue(name.id, forKey: "id")
            
            do {
                try managedContext.save()
                print("updateUserProfileSettings Record Updated! \(record.value(forKey: "id"))")
            } catch let error as NSError{
                print("updateUserProfileSettings Could not save. \(error),\(error.userInfo)")
            }
        }
        
        
    } catch let error as NSError {
        print("updateUserProfileSettings Could not fetch. \(error), \(error.userInfo)")
    }
}

static func getNameSettings() -> [NewViewName] {
    var nameArr = [NewViewName]()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "NameSettingsData")
    var items:[NSManagedObject] = [NSManagedObject]()
    
    do {
        items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
        
        items.forEach { item in
            let user = NewViewName(id: item.value(forKey: "id") as? Bool ?? false,
                                       name: item.value(forKey: "name") as? String ?? "")
                                   
            nameArr.append(user)
        }
        
        
    } catch let error as NSError {
        print("getNameService: Could not fetch. \(error), \(error.userInfo)")
    }
    
    return nameArr
}

//MARK: weatherArray

static func setWeatherArray(name: Weather) {
    let entity = NSEntityDescription.entity(forEntityName: "WeatherData", in: managedContext)!
    let record = NSManagedObject(entity: entity, insertInto: managedContext)
    
    record.setValue(name.id, forKey: "id")
    record.setValue(name.main, forKey: "main")
    record.setValue(name.icon, forKey: "icon")
    record.setValue(name.name, forKey: "name")
    record.setValue(name.lat, forKey: "lat")
    record.setValue(name.lon, forKey: "lon")
    record.setValue(name.country, forKey: "country")
    
    do {
        try managedContext.save()
        print("setWeatherArray Record Added! \(record.value(forKey: "id"))")
    } catch let error as NSError{
        print("setWeatherArray Could not save. \(error),\(error.userInfo)")
    }
}

static func updateWeatherArray(name: Weather) {
    let predicate = NSPredicate(format: "id = %@", name.id ?? "")
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"WeatherData")
    fetchRequest.predicate = predicate
    
    var items:[NSManagedObject] = [NSManagedObject]()
    do {
        items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
        
        items.forEach { record in
            record.setValue(name.id, forKey: "id")
            record.setValue(name.main, forKey: "main")
            record.setValue(name.icon, forKey: "icon")
            record.setValue(name.name, forKey: "name")
            record.setValue(name.lat, forKey: "lat")
            record.setValue(name.lon, forKey: "lon")
            record.setValue(name.country, forKey: "country")
            
            do {
                try managedContext.save()
                print("updateWeatherArray Record Updated! \(record.value(forKey: "id"))")
            } catch let error as NSError{
                print("updateWeatherArray Could not save. \(error),\(error.userInfo)")
            }
        }
        
        
    } catch let error as NSError {
        print("updateWeatherArray Could not fetch. \(error), \(error.userInfo)")
    }
}

static func getWeatherArray() -> [Weather] {
    var nameArrWeather = [Weather]()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherData")
    var items:[NSManagedObject] = [NSManagedObject]()
    
    do {
        items = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
        
        items.forEach { item in
            let user = Weather(id: item.value(forKey: "id") as? String ?? "",
                               main: item.value(forKey: "main") as? String ?? "",
                               icon: item.value(forKey: "icon") as? String ?? "",
                               name: item.value(forKey: "name") as? String ?? "",
                               lat: item.value(forKey: "lat") as? Double ?? "",
                               lon: item.value(forKey: "lon") as? Double ?? "",
                               country: item.value(forKey: "country") as? String ?? "")
           
                                   
            nameArrWeather.append(user)
        }
        
        
    } catch let error as NSError {
        print("getWeatherArray: Could not fetch. \(error), \(error.userInfo)")
    }
    
    return nameArrWeather
}
