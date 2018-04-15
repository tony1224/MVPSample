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
    
    
    
    init(entity: WeatherEntityProtocol) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
