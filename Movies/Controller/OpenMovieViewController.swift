//
//  OpenMovieViewController.swift
//  Movies
//
//  Created by Максим Томилов on 16.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import UIKit


class OpenMovieViewController: UIViewController {

    
    @IBOutlet weak var posterOpenMovie: UIImageView!
    @IBOutlet weak var titleOpenMovie: UILabel!
    @IBOutlet weak var yearOpenMovie: UILabel!
    @IBOutlet weak var countyOpenMovie: UILabel!
    @IBOutlet weak var genreOpenMovie: UILabel!
    @IBOutlet weak var imdbOpenMovie: UILabel!
    @IBOutlet weak var directorOpenMovie: UILabel!
    @IBOutlet weak var plotOpenMovie: UILabel!
    @IBOutlet weak var actorOpenMovie: UILabel!
    
    var movieShow: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if movieShow != nil {
            titleOpenMovie.text = movieShow?.Title
            yearOpenMovie.text = (movieShow?.Year ?? "") + ", " + (movieShow?.Runtime ?? "")
            countyOpenMovie.text = movieShow?.Country
            genreOpenMovie.text = movieShow?.Genre
            imdbOpenMovie.text = movieShow?.imdbRating
            directorOpenMovie.text = movieShow?.Director
            plotOpenMovie.text = movieShow?.Plot
            actorOpenMovie.text = movieShow?.Actors
            if let url = URL(string: movieShow?.Poster ?? "") {
                self.posterOpenMovie.downloadImage(from: url)
            }
            
        }
    }


}
