//
//  ViewController.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 23.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "adlet"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var secondName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "adlet"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var age: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "adlet"
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    
    var viewModel: ViewModel? {
        didSet {
            print("adlet")
            guard let viewModel = viewModel else { return }
            self.name.text = viewModel.name
            self.secondName.text = viewModel.secondName
            self.age.text = viewModel.age
        }
    }
    
//    var profile: Profile? {
//        didSet {
//            guard let profile = profile else { return }
//            self.name.text = profile.name
//            self.secondName.text = profile.secondName
//            self.age.text = "\(profile.age)"
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        profile = Profile(name: "John", secondName: "Smith", age: 33)
        viewModel = ViewModel()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(stack)
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(secondName)
        stack.addArrangedSubview(age)
    }
    
    private func setupConstraints() {
        stack.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.centerY.equalTo(view.snp.centerY)
        }
    }


}

