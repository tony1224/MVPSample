//
//  WeatherEntity.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

// TODO: Protocol化する意味は？
protocol GithubEntityProtocol {

    var dateString: String { get }
    var weather: String { get }
    
    init(dateString: String, weather: String)
}

class GithubEntity: GithubEntityProtocol {

    var dateString: String
    let weather: String
    
    required init(dateString: String, weather: String) {
        self.dateString = dateString
        self.weather = weather
    }

}
