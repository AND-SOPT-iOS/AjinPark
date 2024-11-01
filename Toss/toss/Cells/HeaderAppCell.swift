//
//  HeaderAppCell.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit
import SnapKit

class HeaderAppCell: UICollectionViewCell {
    
    static let identifier = "HeaderAppCell"
    
    private let largeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    private let subtitleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 메서드는 구현되지 않았습니다.")
    }
    
    private func setupUI() {
        contentView.addSubview(largeImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        largeImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(largeImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(5)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
        }
    }
    
    func configure(with app: App) {
        largeImageView.image = UIImage(named: app.iconImage)
        titleLabel.text = app.title
        subtitleLabel.text = app.subTitle
    }
}
