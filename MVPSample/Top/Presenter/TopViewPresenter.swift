//
//  WeatherListViewPresenter.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

protocol TopViewPresenterProtocol: class {

    var githubInfoCounts: Int { get }

    init(view: TopViewDelegate)
    
    func updateWeathers()
    func getEntity(at: Int) -> GithubEntityProtocol
    func didSelectRow(at index: Int)

}

class TopViewPresenter: TopViewPresenterProtocol {
    
    private let view: TopViewDelegate
    private let model: GithubModelProtocol
    
    var githubInfoCounts: Int {
        return model.githubInfoList.count
    }
    
    required init(view: TopViewDelegate) {
        self.view = view
        self.model = GithubModel(query: "swift")
        
        // 初回表示時に通信
        self.model.fetchGithubInfo(completion: { error in
            guard let error = error else {
                return
            }
            // エラーがあったらなんかする
            print(error)
        })
    }
        
    func updateWeathers() {
        self.model.resetGithubInfo()
        self.model.fetchGithubInfo(completion: { error in
            guard let error = error else {
                return
            }
            // エラーがあったらなんかする
            print(error)
        })
    }
    
    func getEntity(at index: Int) -> GithubEntityProtocol {
        return self.model.githubInfoList[index]
    }

    func didSelectRow(at index: Int) {
        let entity = self.model.githubInfoList[index]
        self.view.transitToDetail(entity: entity)
    }

}
