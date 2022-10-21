//
//  Connection.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import Foundation

//MARK: - GET NewViewController

static func makeNameSettings(appDelegate: AppDelegate, newViewName: NewViewName, _ callback: @escaping (_ success: Bool, _ error: String?, _ response: NewViewName?) -> Void) {
    
    makePostReques(appDelegate: appDelegate, request: ConnectionConfig.getLink(.makeNameSettings), requestData: NSMutableData(data: (NewViewName.getJSONforCreating()).data(using: String.Encoding.utf8)!)) { success, error, responce in
        if success {
            do {
                let json = try JSONSerialization.jsonObject(with: responce!, options: .allowFragments)
                if let obj = json as? [String: Any] {
                    print("json is a dictionary makeNameSettings")
                    print(obj)
                    
                    if String.pjs(obj["status"]) == ok {
                        if let object = obj["payload"] as? [String: Any] {
                            let user = NewViewName(object: object)
                            DispatchQueue.main.async {
                                callback(success, nil, user)
                            }
                        }
                    } else if String.pjs(obj["status"]) == statusError {
                        if let object = obj["payload"] as? [String: Any] {
                            
                            let errorMessage = String.pjs(object["message"])
                            
                            DispatchQueue.main.async {
                                callback(false, errorMessage, nil)
                            }
                        }
                    }
                } else {
                    print("JSON is invalid")
                    DispatchQueue.main.async {
                        callback(false, "JSON is invalid", nil)
                    }
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    callback(false, error.localizedDescription, nil)
                }
            }
        } else {
            DispatchQueue.main.async {
                callback(success, error, nil)
            }
        }
        
    }
    
}

static func getNameSettings(appDelegate: AppDelegate, nameSettings: NewViewName, _ callback: @escaping (_ success: Bool, _ error: String?, _ response: [NewViewName]?) -> Void) {
    makeGetRequest(appDelegate: appDelegate, request: ConnectionConfig.getLink(.getNameSettings) + nameSettings.id!) { success, error, responce in
        
        if success {
            do {
                let json = try JSONSerialization.jsonObject(with: responce!, options: .allowFragments)
                print("jsonNEWVIEWNAME \(json)")
                if let obj = json as? [String: Any] {
                    if String.pjs(obj["status"]) == ok {
                        
                        if let payload = obj["payload"] as? [Any] {
                            
                            var NewViewNameArr: [NewViewName] = [NewViewName]()
                            
                            for userObject in payload {
                                let user = NewViewName(object: userObject as! [String: Any])
                                NewViewNameArr.append(user)
                            }
                            
                            DispatchQueue.main.async {
                                callback(success, nil,  NewViewNameArr)
                            }
                        }
                    } else if String.pjs(obj["status"]) == statusError {
                        
                        if let object = obj["payload"] as? [String: Any] {
                            let errorMessage = String.pjs(object["message"])
                            
                            DispatchQueue.main.async {
                                callback(false, errorMessage, nil)
                            }
                        }
                        
                    }
                } else {
                    print("JSON is invalid")
                    DispatchQueue.main.async {
                        callback(false, "JSON is invalid", nil)
                    }
                }
                
            } catch {
                print(error)
                DispatchQueue.main.async {
                    callback(false, error.localizedDescription, nil)
                }
            }
        } else {
            DispatchQueue.main.async {
                callback(false, error, nil)
            }
        }
        
    }
}
//MARK: - GET WeatherViewController

static func makeWeatherArray(appDelegate: AppDelegate, weather: Weather, _ callback: @escaping (_ success: Bool, _ error: String?, _ response: Weather?) -> Void) {
    
    makePostReques(appDelegate: appDelegate, request: ConnectionConfig.getLink(.makeWeatherArray), requestData: NSMutableData(data: (Weather.getJSONforCreating()).data(using: String.Encoding.utf8)!)) { success, error, responce in
        if success {
            do {
                let json = try JSONSerialization.jsonObject(with: responce!, options: .allowFragments)
                if let obj = json as? [String: Any] {
                    print("json is a dictionary makeWeatherArray")
                    print(obj)
                    
                    if String.pjs(obj["status"]) == ok {
                        if let object = obj["payload"] as? [String: Any] {
                            let user = Weather(object: object)
                            DispatchQueue.main.async {
                                callback(success, nil, user)
                            }
                        }
                    } else if String.pjs(obj["status"]) == statusError {
                        if let object = obj["payload"] as? [String: Any] {
                            
                            let errorMessage = String.pjs(object["message"])
                            
                            DispatchQueue.main.async {
                                callback(false, errorMessage, nil)
                            }
                        }
                    }
                } else {
                    print("JSON is invalid")
                    DispatchQueue.main.async {
                        callback(false, "JSON is invalid", nil)
                    }
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    callback(false, error.localizedDescription, nil)
                }
            }
        } else {
            DispatchQueue.main.async {
                callback(success, error, nil)
            }
        }
        
    }
    
}

static func getWeatherArray(appDelegate: AppDelegate, lat: String, lon: String, appid: String, _ callback: @escaping (_ success: Bool, _ error: String?, _ response: [Weather]?) -> Void) {
    makeGetRequestWeather(appDelegate: appDelegate, request: ConnectionConfig.getLink(.getWeatherArray) + "lat=\(lat)&lon=\(lon)&appid=\(appid)&units=metric") { success, error, responce in
        
        if success {
            do {
                let json = try JSONSerialization.jsonObject(with: responce!, options: .allowFragments)
                print("jsonWEATHER \(json)")
                if let obj = json as? [String: Any] {
                    var WeatherArr: [Weather] = [Weather]()
                                                    
                                                    for userObject in payload {
                                                        let user = Weather(object: userObject as! [String: Any])
                                                        WeatherArr.append(user)
                                                    }
                                                    
                                                    DispatchQueue.main.async {
                                                        callback(success, nil,  WeatherArr)
                                                    }
                    
                } else {
                    print("JSON is invalid")
                    
                    DispatchQueue.main.async {
                        callback(false, "JSON is invalid", nil)
                    }
                }
                
            } catch {
                print(error)
                DispatchQueue.main.async {
                    callback(false, error.localizedDescription, nil)
                }
            }
        } else {
            DispatchQueue.main.async {
                callback(false, error, nil)
            }
        }
        
    }
}
