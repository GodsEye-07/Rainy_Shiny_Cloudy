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
                print(response)
            }
            complete()
        }
    
    
    
    
 // end of the class
}
