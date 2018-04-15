//
//  DetailViewPresenter.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

protocol WeatherDetailViewPresenterProtocol {
    var date: String { get }
    var weather: String { get }
    init(entity: GithubEntityProtocol)
}

class DetailViewPresenter: WeatherDetailViewPresenterProtocol {

    let entity: GithubEntityProtocol

    var date: String {
        return self.entity.dateString
    }
    
    var weather: String {
        return self.entity.weather
    }
    
    required init(entity: GithubEntityProtocol) {
        self.entity = entity
    }
    
}
