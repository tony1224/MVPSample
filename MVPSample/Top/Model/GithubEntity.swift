//
//  WeatherEntity.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

protocol GithubEntityProtocol {

    var id: Int { get }
    var fullName: String { get }
    
    init(id: Int, fullName: String)
}

class GithubEntity: GithubEntityProtocol {

    var id: Int
    let fullName: String
    
    required init(id: Int, fullName: String) {
        self.id = id
        self.fullName = fullName
    }

}
