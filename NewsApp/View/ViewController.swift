//
//  ViewController.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var newsListVM : NewsListViewModel!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        setUp()
    }

    func setUp(){
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=02bc5fb2d8ae4d73973e8fe89b93570f")
        
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

}

