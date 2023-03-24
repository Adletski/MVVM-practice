//
//  ProfileTableViewCell.swift
//  MVVM
//
//  Created by Adlet Zhantassov on 23.03.2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            name.text = viewModel.fullName
            age.text = viewModel.age
        }
    }
    
    lazy var name: UILabel = {
         let label = UILabel()
         label.textColor = .black
         label.font = .systemFont(ofSize: 15)
         return label
    }()
    
    lazy var age: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(name)
        addSubview(age)
    }
    
    private func setupConstraints() {
        name.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        age.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
        }
    }

}
