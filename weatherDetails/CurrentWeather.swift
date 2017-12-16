//
//  currentWeather.swift
//  weatherDetails
//
//  Created by Ayush Verma on 16/12/17.
//  Copyright © 2017 Ayush Verma. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date : String!
    var _weatherType : String!
    var _currentTemprature : Double!
    
    
    var  cityName :String {
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    
    var  date :String {
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today ,\(currentDate)"
        
        return _date
    }
    
    var  weatherType :String {
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var  currentTemprature :Double {
        if _currentTemprature == nil{
            _currentTemprature = 0.0
        }
        return _currentTemprature
    }
    
    func downloadWeatherDetails(complete: DownloadComplete){
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON{
                response in
            let Results = response.result
            
            if let dict = Results.value as? Dictionary<String,AnyObject>{
                if let name = dict["name"] as? String{
                        self._cityName = name.capitalized
                        print(self._cityName)
                    }
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject>{
                    if let currentTemp = main["temp"] as? Double{
                        
                        let kelvinToFarenhiet = (currentTemp * (9/5) - 459.67)
                        let kelvin = Double(round(10 * kelvinToFarenhiet/10))
                        self._currentTemprature = kelvin
                        print(self._currentTemprature)
                    }
                }
                
            }
        }
        complete()
    }
    
    
    
    
 // end of the class
}
