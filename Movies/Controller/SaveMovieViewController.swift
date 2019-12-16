//
//  SaveMovieViewController.swift
//  Movies
//
//  Created by Максим Томилов on 14.12.2019.
//  Copyright © 2019 Tomily. All rights reserved.
//

import UIKit
import RealmSwift

class SaveMovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var movieTable: UITableView!
    
    var allMovies = Array(realm.objects(Movie.self))

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = allMovies[indexPath.row]
        cell.movieTitle.text = movie.Title
        cell.movieRuntime.text = movie.Year + ", " + movie.Runtime
        cell.movieGenre.text = movie.Genre
        cell.movieRating.text = "IMDb: " + movie.imdbRating
        if let url = URL(string: movie.Poster) {
            cell.moviePoster.downloadImage(from: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let movie = allMovies[indexPath.row]
                
                DBManager.deleteMovie(movie: movie)
                allMovies = Array(realm.objects(Movie.self))
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = movieTable.indexPathForSelectedRow else { return }
            var movie: Movie
            movie = allMovies[indexPath.row]
            let newMovieVC = segue.destination as! OpenMovieViewController
            newMovieVC.movieShow = movie
        }
    }
}
