//
//  API.swift
//  Movies
//
//  Created by Максим Томилов on 14.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String : Any]

class API { 
    
    static var baseURL: String {
            "http://www.omdbapi.com/"
        }
    var parametrs : String = ""
    static func loadMovie(title : String, completion: @escaping (Movie?, NSError?) -> Void) {
            let param : Parameters = [
                "apikey": "994d2f1d",
                "t" : title
            ]
            AF.request(baseURL, method: .get, parameters: param)
                .validate(statusCode: 200..<300)
                .responseJSON {response in
                    switch response.result {
                    case .success(let value) :
                        let movieData = value as! JSON
                        var movies = Movie(data: movieData)
                            completion(movies, nil)

                    case .failure(let error) :
                        completion(nil, error as NSError)
                    }
                }
            }
}
