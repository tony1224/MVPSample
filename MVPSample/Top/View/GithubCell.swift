//
//  WeatherViewCell.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

class GithubCell: UITableViewCell {

    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var fullNameLabel: UILabel!
    
    func setData(entity: GithubEntityProtocol) {
        self.idLabel.text = "\(entity.id)"
        self.fullNameLabel.text = entity.fullName
    }

}
