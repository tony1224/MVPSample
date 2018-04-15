//
//  ViewController.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

protocol TopViewDelegate: class {
    func reloadData()
    func transitToDetail(entity: GithubEntityProtocol)
}

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! {
        didSet {
            self.tableView.refreshControl = UIRefreshControl()
            self.tableView.refreshControl?.addTarget(self, action: #selector(self.updateWeathers), for: .valueChanged)
            // TODO: cellのregisterが必要ならここで
        }
    }
    private(set) var presenter: TopViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = TopViewPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateWeathers() {
        self.presenter.updateWeathers()
        self.tableView.refreshControl?.beginRefreshing()
    }

}

extension ViewController: TopViewDelegate {
    
    func reloadData() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    func transitToDetail(entity: GithubEntityProtocol) {
        // TODO: VCが取得できない場合のエラーを考えておく必要あり
        if let vc = DetailViewController.setup(entity: entity) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.githubInfoCounts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherViewCell
        let entity = self.presenter.getEntity(at: indexPath.row)
        cell.setData(entity: entity)
        return cell
    }
    
}
