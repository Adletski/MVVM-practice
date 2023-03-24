//
//  NetworkManager.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> ()) {
        completion(["Moview1","Movie2","Movie3"])
    }
}
