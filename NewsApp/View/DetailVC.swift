//
//  DetailVC.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var DdescriptionLabel: UILabel!
    @IBOutlet weak var DauthorLabel: UILabel!
    @IBOutlet weak var DtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var detailData : News?
    
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DdescriptionLabel.sizeToFit()
        DdescriptionLabel.textAlignment = .left
        DauthorLabel.sizeToFit()
        DtitleLabel.sizeToFit()
        
       getData()
        
    }
    
   func getData(){
        
       if let urlString = URL(string: detailData?.urlToImage ?? ""){
           DispatchQueue.main.async {
               do{
                   self.data = try Data(contentsOf: urlString)
                   DispatchQueue.main.async {
                       self.imageView.image = UIImage(data: self.data)
                   }
               } catch{
                   print("ErrorDetailsImage")
                    }
               }
           }
       
       self.DdescriptionLabel.text = detailData?.description
       self.DtitleLabel.text = detailData?.title
       self.DauthorLabel.text = detailData?.author
    
   }
    
}


