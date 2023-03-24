//
//  DetailViewModel.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var profile: Profile
    
    var description: String {
        return profile.name + " " + profile.secondName + " " + String(profile.age)
    }
    
    var age: Box<String?> = Box(value: nil)
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
