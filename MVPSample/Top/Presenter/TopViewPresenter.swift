//
//  WeatherListViewPresenter.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

protocol TopViewPresenterDelegate: class {

    var githubInfoCounts: Int { get }

    init(view: TopViewDelegate)
    
    func updateWeathers()
    func getEntity(at: Int) -> GithubEntityProtocol
    func didSelectRow(at index: Int)

}

class TopViewPresenter: TopViewPresenterDelegate {
    
    private let view: TopViewDelegate
    private let model: GithubModelProtocol
    
    var githubInfoCounts: Int {
        return model.githubInfoList.count
    }
    
    required init(view: TopViewDelegate) {
        self.view = view
        self.model = GithubModel(query: "swift")
    }
        
    func updateWeathers() {
        self.model.resetGithubInfo()
        self.model.fetchGithubInfo()
    }
    
    func getEntity(at index: Int) -> GithubEntityProtocol {
        return self.model.githubInfoList[index]
    }

    func didSelectRow(at index: Int) {
        let entity = self.model.githubInfoList[index]
        self.view.transitToDetail(entity: entity)
    }

}
