//
//  ViewController.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var newsListVM : NewsListViewModel!

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    var lang : String = "tr"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        setUp()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setUp()
        
    }

    func setUp(){
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(lang)&apiKey=02bc5fb2d8ae4d73973e8fe89b93570f")
        
        WebService().getData(url: url!) { news in
            if let news = news {
                self.newsListVM = NewsListViewModel(newss: news)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsListVM == nil ? 0 : self.newsListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NewsTableViewCell
        let newsVM = newsListVM.newsAtIndex(indexPath.row)
        
        cell.titleLabel.text = newsVM.title
        cell.authorLabel.text = newsVM.author
        cell.descriptionLabel.text = newsVM.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailVC
        let newsVM = newsListVM.newss
        vc?.detailData = newsVM[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 8.0
        
        cell.alpha = 0.5
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex{
            
        case 0:
            lang = "tr"
            navigationItem.title = "Haberler"
            viewWillAppear(true)
        case 1:
            lang =  "us"
            navigationItem.title = "News"
            viewWillAppear(true)
        default:
            break
        }
    }
    
}

