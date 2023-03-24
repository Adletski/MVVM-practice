//
//  DetailViewViewModelType.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
