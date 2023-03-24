//
//  NetworkViewModel.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import Foundation

class NetworkViewModel: NSObject {
    
    var networkManager: NetworkManager?
    
    private var movies: [String]?
    
    func fetchMovies(completion: @escaping () -> ()) {
        networkManager?.fetchMovies(completion: { [weak self] movies in
            self?.movies = movies
            completion()
        })
    }
    
    func numberOfRowsInSection() -> Int {
        return movies?.count ?? 0
    }
    
    func titleForCell(atIndexPath indexPath: IndexPath) -> String {
        guard let movies = movies else { return "" }
        return movies[indexPath.row]
        
    }
}
