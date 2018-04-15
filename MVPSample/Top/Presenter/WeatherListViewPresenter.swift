//
//  WeatherListViewPresenter.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

protocol WeatherListViewPresenterProtocol: class {
    // properties
    var numberOfWeathers: Int { get }
    // init
    init(view: WeatherListViewProtocol)
    
    // method
    func updateWeathers()
    func entity(at: IndexPath) -> WeatherEntityProtocol
    func didSelectRow(at indexPath: IndexPath)
}

class WeatherListViewPresenter: WeatherListViewPresenterProtocol {
    // properties
    private let view: WeatherListViewProtocol
    private let model: WeatherModelProtocol
    
    var numberOfWeathers: Int {
        return model.weathers.count
    }
    
    required init(view: WeatherListViewProtocol) {
        self.view = view
        let api = WeatherAPI()
        self.model = WeatherModel(api: api)
        // イミフ
        // なんとなく引っ張って更新でPとかMにイベント渡すのはわかるんだけど。。
//        model.addObserver(self, selector: #selector(self.updated))
    }
    
    deinit {
//        model.removeObserver(self)
    }
    
    // method
    
    func updateWeathers() {
        self.model.resetWeathers()
        // APIリクエスト
        self.model.fetchWeathers()
    }
    
    func entity(at indexPath: IndexPath) -> WeatherEntityProtocol {
        return self.model.weathers[indexPath.row]
    }

    // MからEntityを取得し、Viewに渡すための処理だよ！
    func didSelectRow(at indexPath: IndexPath) {
        // 次画面へ遷移する
        let entity = self.model.weathers[indexPath.row]
        self.view.navigateDetail(entity: entity)
    }

}
