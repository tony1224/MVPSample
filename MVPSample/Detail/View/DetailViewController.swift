//
//  DetailViewController.swift
//  MVPSample
//
//  Created by Morita Jun on 2018/04/15.
//  Copyright © 2018年 KamuiProject. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var weatherLabel: UILabel!
    
    var presenter: WeatherDetailViewPresenterProtocol!
    
    // MARK: - Setup
    static func setup(entity: GithubEntityProtocol) -> DetailViewController? {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! DetailViewController
        vc.presenter = DetailViewPresenter(entity: entity)
        return vc
    }
    
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
