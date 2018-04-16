//
//  WeatherAPI.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit
import APIKit

final class GithubAPI {
    private init() {}
    
    struct SearchRepositories: GithubRequest {
        typealias Response = SearchRepositoriesResponse
        
        let method: HTTPMethod = .get
        let path: String = "/search/repositories"
        let query: String
        var parameters: Any? {
            return ["q": query, "page": 1]
        }
    }
    
}
