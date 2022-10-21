//
//  WeatherNewViewController.swift
//  uuuu
//
//  Created by Евгения Аникина on 29.07.2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: Segment
    @IBOutlet weak var weatherSegment: UISegmentedControl!
    
    //MARK: Weather region
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var cloudImage: UIImageView!
    @IBOutlet weak var celsiumLabel: UILabel!
    
    //MARK: View
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var regionView: UIView!
    
    
    var weatherArray: [Weather]? = []
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()
        regionLabel.text = name
    }
    
    @IBAction func weatherSegmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.weatherView.isHidden = false
            self.regionView.isHidden = true
        case 1:
            self.weatherView.isHidden = true
            self.regionView.isHidden = false
        default:
            self.weatherView.isHidden = false
            self.regionView.isHidden = true
        }
        
        @IBAction func backButtonWeather(_ sender: Any) {
            self.dismiss(animated: true)
        }
//        "https://api.openweathermap.org/data/2.5/forecast?lat=55.604602&lon=37.356252&appid=40be0c5942c4a19b41bd48533f0071ff&units=metric"
        private func getWeatherArray() {
            ConnectionHelper.getWeatherArray(appDelegate: self.appDelegate, lat: "55.604602", lon: "37.356252", appid: "40be0c5942c4a19b41bd48533f0071ff") { success, error, response in
                print("success \(success)")
                print("error \(error)")
                print("response \(response)")
            }
            
            self.weatherArray = DB.getWeatherArray()
        }
        
        private func setWeatherArray() {
            let name = WeatherArray(name: "Moskovskiy", id: "id857690")
            DB.setWeatherArray(name: name)
        }
        
            
                      
    }

