//
//  WeatherViewCell.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

class WeatherViewCell: UITableViewCell {

    @IBOutlet private weak var weatherLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func setData(entity: WeatherEntityProtocol) {
        self.dateLabel.text = entity.dateString
        self.weatherLabel.text = entity.weather
    }

}
