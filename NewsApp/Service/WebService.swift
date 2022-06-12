//
//  WebService.swift
//  NewsApp
//
//  Created by Celil Aydın on 13.06.2022.
//

import Foundation
import UIKit


class WebService {
    
    func getData(url : URL , completion: @escaping ([News]?)->()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let result = try? JSONDecoder().decode(NewsList.self, from: data)
                
                if let result = result {
                    completion(result.articles)
                }
            }
        }.resume()
    }
    
}
