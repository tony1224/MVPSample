//
//  GithubRepositoriesResponse.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import Foundation

struct SearchRepositoriesResponse: Decodable {
    let items: [Repository]
}

struct Repository: Decodable {
    let id: Int
    let fullName: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
    }

}
