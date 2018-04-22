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
    
    func fetchGithubInfo(text: String, completion:@escaping (_ error: Error?)->Void)
    func resetGithubInfo()
}

class GithubModel: GithubModelProtocol {

    private(set) var githubInfoList: [GithubEntityProtocol] = []
    
    func fetchGithubInfo(text: String, completion:@escaping (_ error: Error?)->Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let request = GithubAPI.SearchRepositories(query: text)
        Session.send(request) { result in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false

            switch result {
            case .success(let response):
                // NOTE: ここのresponse.itemsはnon-optional
                // itemの中の項目も
                response.items.forEach { item in
                    let entity = GithubEntity(id: item.id, fullName: item.fullName, thumbnailUrl: item.thumbnailUrl)
                    self.githubInfoList.append(entity)
                }
                // NOTE: 1個だった場合も正常として帰す。
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func resetGithubInfo() {
        self.githubInfoList = []
    }

}
