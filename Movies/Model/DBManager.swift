//
//  DBManager.swift
//  Movies
//
//  Created by Максим Томилов on 15.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class DBManager {
    
    static func saveMovie(_ movie: Movie) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(movie)
        }
    }
    
    static func deleteMovie(movie: Movie) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(movie)
        }
    }
    
    
    
}
