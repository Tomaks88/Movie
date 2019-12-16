//
//  ExtUIImage.swift
//  Movies
//
//  Created by Максим Томилов on 15.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import Foundation
import UIKit 

extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
