//
//  ViewModel2.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 23.03.2023.
//

import Foundation

class ViewModel2: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    var profiles = [Profile(name: "John", secondName: "Smith", age: 33),
                    Profile(name: "MAx", secondName: "Kolby", age: 21),
                    Profile(name: "Mark", secondName: "Salmon", age: 55)]
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
}
