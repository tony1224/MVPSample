//
//  DetailViewPresenter.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

protocol GithubDetailViewPresenterProtocol {
    var id: Int { get }
    var fullName: String { get }
    
    init(entity: GithubEntityProtocol)
}

class DetailViewPresenter: GithubDetailViewPresenterProtocol {

    let entity: GithubEntityProtocol

    var id: Int {
        return self.entity.id
    }
    
    var fullName: String {
        return self.entity.fullName
    }
    
    required init(entity: GithubEntityProtocol) {
        self.entity = entity
    }
    
}
