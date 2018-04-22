//
//  WeatherListViewPresenter.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

protocol TopViewPresenterProtocol: class {

    var githubInfoCounts: Int { get }

    init(view: TopViewDelegate, model: GithubModelProtocol)
    
    func updateGithubInfo(text: String)
    func getEntity(at: Int) -> GithubEntityProtocol
    func didSelectRow(at index: Int)

}

class TopViewPresenter: TopViewPresenterProtocol {
    
    private let view: TopViewDelegate
    // TODO: ここletにできない？ただDI的にはこうせざるを得ない？
    private var model: GithubModelProtocol
    
    var githubInfoCounts: Int {
        return model.githubInfoList.count
    }
    
    required init(view: TopViewDelegate, model: GithubModelProtocol) {
        self.view = view
        self.model = model
        
        // 初回表示時に通信
        // NOTE: 初回なので渡せる文字列は無し
        // TODO: Realmで情報を保持しておいてそれを初回に通信するようにしたい
        // まぁそれは持ってくるのではなくて、ここで取得すれば良いだけか
        self.model.fetchGithubInfo(text: "", completion: { [weak self] error in
            guard let error = error else {
                self?.view.reloadData()
                return
            }
            // エラーがあったらなんかする
            print(error)
        })
    }
        
    func updateGithubInfo(text: String) {
        self.model.resetGithubInfo()
        self.model.fetchGithubInfo(text: text, completion: { [weak self] error in
            guard let error = error else {
                self?.view.reloadData()
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
