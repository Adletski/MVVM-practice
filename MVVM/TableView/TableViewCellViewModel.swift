//
//  TableViewCellViewModel.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var profile: Profile
    
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(profile.age)
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
}
