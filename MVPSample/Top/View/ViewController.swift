//
//  ViewController.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/14.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

protocol WeatherListViewProtocol: class {
    func reloadData()
    func navigateDetail(entity: WeatherEntityProtocol)
}

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! {
        didSet {
            self.tableView.refreshControl = UIRefreshControl()
            self.tableView.refreshControl?.addTarget(self, action: #selector(self.updateWeathers), for: .valueChanged)
            // TODO: cellのregisterが必要ならここで
        }
    }
    private(set) var presenter: WeatherListViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = WeatherListViewPresenter(view: self)
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

extension ViewController: WeatherListViewProtocol {
    
    func reloadData() {
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    func navigateDetail(entity: WeatherEntityProtocol) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfWeathers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherViewCell
        let entity = self.presenter.entity(at: indexPath)
        cell.setData(entity: entity)
        return cell
    }
    
}
