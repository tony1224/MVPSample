//
//  WeatherRequest.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import Foundation
import APIKit

protocol GithubRequest: Request {}

extension GithubRequest {
    var baseURL: URL { return URL(string: "https://")! }
}

extension GithubRequest where Response: Decodable {

    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }

}
