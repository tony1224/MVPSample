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

    // 入力文字列
    private var text: String = ""
    
    @IBOutlet private var tableView: UITableView! {
        didSet {
            // はじめは非表示で
            self.tableView.isHidden = true
            self.tableView.tableFooterView = UIView()
            self.tableView.refreshControl = UIRefreshControl()
            self.tableView.refreshControl?.addTarget(self, action: #selector(self.updateGithubInfo), for: .valueChanged)
            // NOTE: Cellのregister処理もここで
        }
    }
    private(set) var presenter: TopViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = TopViewPresenter(view: self, model: GithubModel())
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
    
    @objc func updateGithubInfo() {
        self.presenter.updateGithubInfo(text: self.text)
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

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss the keyboard
        self.text = textField.text!
        self.presenter.updateGithubInfo(text: self.text)
        return true
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: ここpresenterが生成される前に呼ばれる
        guard let presenter = self.presenter else {
            return 0
        }
        // TODO: ここでしか件数判定=表示判定できない？コールバックを持たないので
        if presenter.githubInfoCounts > 0 {
            self.tableView.isHidden = false
            return presenter.githubInfoCounts
        } else {
            self.tableView.isHidden = true
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GithubCell
        let entity = self.presenter.getEntity(at: indexPath.row)
        cell.setData(entity: entity)
        return cell
    }
    
}
