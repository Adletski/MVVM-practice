//
//  Box.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
    
    init(value: T) {
        self.value = value
    }
}
