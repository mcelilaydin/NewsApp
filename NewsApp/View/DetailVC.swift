//
//  DetailVC.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var DdescriptionLabel: UILabel!
    
    var detailData : News?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.DdescriptionLabel.text = detailData?.description
    }

}
