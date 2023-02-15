//
//  OnboardingVC.swift
//  NewsApp
//
//  Created by Celil Aydın on 15.02.2023.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var onboardingImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "openApp")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: true)
    }
}
