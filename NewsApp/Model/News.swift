//
//  News.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import Foundation

struct NewsList: Decodable {
    
    let articles: [News]
    
}


struct News: Decodable {
    
    let title: String?
    let author: String?
    let description: String?
    let urlToImage: String?
    
}
