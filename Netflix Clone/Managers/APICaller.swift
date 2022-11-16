//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Aligazy Kismetov on 12.11.2022.
//

import Foundation

struct Constants{
    static let API_KEY = "e7575c18b0ca413b3fb2385b9c8c855a"
    static let baseURL = "https://api.themoviedb.org/"
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
            }catch{
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
    }
}
