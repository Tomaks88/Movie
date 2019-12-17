//
//  MovieViewController.swift
//  Movies
//
//  Created by Максим Томилов on 14.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import UIKit
import RealmSwift

class MovieViewController: UIViewController {

    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var yearRuntime: UILabel!
    @IBOutlet weak var countryMovie: UILabel!
    @IBOutlet weak var directorMovie: UILabel!
    @IBOutlet weak var genreMovie: UILabel!
    @IBOutlet weak var ratingsMovie: UILabel!
    @IBOutlet weak var actorsMovie: UILabel!
    @IBOutlet weak var plotMovie: UILabel!
    @IBOutlet weak var loadMovieIndicator: UIActivityIndicatorView!

    
    var loadMovie : Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideView(true)
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    
    @IBAction func saveFavoriteButton(_ sender: Any) {
        if loadMovie != nil {
            DBManager.saveMovie(loadMovie!)
        }
    }
    
    func searchMovie (title: String) {
        loadMovieIndicator.startAnimating()
        API.loadMovie(title: title) {movie, error in
            self.loadMovieIndicator.stopAnimating()
            guard let searchMovie = movie else {return}
            self.hideView(false)
            self.loadMovie = searchMovie
            if let url = URL(string: searchMovie.Poster) {
                self.posterMovie.downloadImage(from: url)
            }
            self.title = searchMovie.Title
            self.titleMovie.text = searchMovie.Title
            self.yearRuntime.text = searchMovie.Year + ", " + searchMovie.Runtime
            self.countryMovie.text = searchMovie.Country
            self.genreMovie.text = searchMovie.Genre
            self.directorMovie.text = "Director: " + searchMovie.Director
            self.actorsMovie.text = "Actors: " + searchMovie.Actors
            self.plotMovie.text = "Plot: " + searchMovie.Plot
            self.ratingsMovie.text = "IMDb: " + searchMovie.imdbRating
        }
    }
    
    @IBAction func movieSearchButton(_ sender: UIButton) {
        let search = UIAlertController(title: "Search Movie", message: "Enter the title", preferredStyle: .alert)
        search.addTextField {(textField) in
            textField.placeholder = "title"
            textField.keyboardType = .decimalPad
        }
        let searchAction = UIAlertAction(title: "Search", style: .default) { (action) in
            if search.textFields != nil {
                let textField = search.textFields![0] as UITextField
                if textField.text != nil {
                    self.searchMovie(title: textField.text!)
                }
            }
        }
        let cancelSearch = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        search.addAction(searchAction)
        search.addAction(cancelSearch)
        
        self.present(search, animated: true, completion: nil)
    }
    
    
    func hideView (_ isHidden: Bool){
        posterMovie.isHidden = isHidden
        titleMovie.isHidden = isHidden
        yearRuntime.isHidden = isHidden
        countryMovie.isHidden = isHidden
        directorMovie.isHidden = isHidden
        genreMovie.isHidden = isHidden
        ratingsMovie.isHidden = isHidden
        actorsMovie.isHidden = isHidden
        plotMovie.isHidden = isHidden
    }
    

}
