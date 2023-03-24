//
//  ViewModel.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 23.03.2023.
//

import Foundation

class ViewModel {
    
    private var profile = Profile(name: "John", secondName: "Smith", age: 33)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(profile.age)
    }
}
