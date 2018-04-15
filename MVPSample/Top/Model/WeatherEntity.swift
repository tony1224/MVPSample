//
//  WeatherEntity.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

protocol WeatherEntityProtocol {
    // properties
    var dateString: String { get }
    var weather: String { get }
    
    // init
    init(dateString: String, weather: String)
}

class WeatherEntity: WeatherEntityProtocol {

    // MARK: properties
    var dateString: String
    let weather: String
    
    // MARK: init
    required init(dateString: String, weather: String) {
        self.dateString = dateString
        self.weather = weather
    }

}
