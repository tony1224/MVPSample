//
//  GithubModel.swift
//  mvp-prac
//
//  Created by HikaruSato on 2017/10/02.
//  Copyright © 2017年 HikaruSato. All rights reserved.
//

import Foundation
import APIKit

protocol GithubModelProtocol: class {
    var githubInfoList: [GithubEntityProtocol] { get }
    
    init(query: String)
    
    func fetchGithubInfo()
    func resetGithubInfo()
}

class GithubModel: GithubModelProtocol {

    private(set) var githubInfoList: [GithubEntityProtocol] = []
    private let query: String
    
    required init(query: String) {
        self.query = query
    }
    
    func resetGithubInfo() {
        self.githubInfoList = []
    }
    
    func fetchGithubInfo() {
        let request = GithubAPI.SearchRepositories(query: self.query)
        Session.send(request) { result in
            
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

}
