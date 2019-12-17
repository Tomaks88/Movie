//
//  Movie.swift
//  Movies
//
//  Created by Максим Томилов on 14.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import Foundation
import RealmSwift

class Movie : Object, Codable {
    
   @objc dynamic var Poster : String = ""
   @objc dynamic var Title : String = ""
   @objc dynamic var Year : String = ""
   @objc dynamic var Country : String = ""
   @objc dynamic var Runtime : String = ""
   @objc dynamic var Plot : String = ""
   @objc dynamic var Director : String = ""
   @objc dynamic var Actors : String = ""
   @objc dynamic var Genre : String = ""
   @objc dynamic var imdbRating : String = ""

    convenience init(Poster: String, Title : String, Year : String, Country : String, Runtime : String, Plot : String, Director : String, Actors : String, Genre : String, imdbRating : String){
        self.init()
        self.Poster = Poster
        self.Title = Title
        self.Year = Year
        self.Country = Country
        self.Runtime = Runtime
        self.Plot = Plot
        self.Director = Director
        self.Actors = Actors
        self.Genre = Genre
        self.imdbRating = imdbRating
    }
    
    convenience init(data: JSON){
        self.init()
        Poster = data["Poster"] as! String
        Title = data["Title"] as! String
        Year = data["Year"] as! String
        Country = data["Country"] as! String
        Runtime = data["Runtime"] as! String
        Plot = data["Plot"] as! String
        Director = data["Director"] as! String
        Actors = data["Actors"] as! String
        Genre = data["Genre"] as! String
        imdbRating = data["imdbRating"] as! String


    }

}

