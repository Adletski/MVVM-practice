//
//  DetailViewController.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 24.03.2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        viewModel?.age.bind { [unowned self] in
            guard let string = $0 else { return }
            self.textLabel.text = string
        }
        
        delay(delay: 5) { [unowned self] in
            self.viewModel?.age.value = "some new value"
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(textLabel)
    }
    
    private func setupConstraints() {
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        self.textLabel.text = viewModel.description
    }
    
    private func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + delay) {
            closure()
        }
    }

}
