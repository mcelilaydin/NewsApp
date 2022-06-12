//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import Foundation

struct NewsListViewModel{
    
    let newss: [News]
    
}

extension NewsListViewModel {
    
    var numberOfSection: Int{
        return newss.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int{
        return newss.count
    }
    
    func newsAtIndex(_ index: Int) -> NewsViewModel{
        
        let news = self.newss[index]
        return NewsViewModel(news)
        
    }
    
}


//MARK: -

struct NewsViewModel {
    
    private let news : News
    
}

extension NewsViewModel {
    
    init(_ news: News){
        self.news = news
    }
}

extension NewsViewModel {
    
    var title: String? {
        return self.news.title
    }
    
    var author: String? {
        return self.news.author
    }
    
    var description: String?{
        return self.news.description
    }
}
