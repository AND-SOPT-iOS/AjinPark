//  PopularTableViewCell.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit
import SnapKit
import Then

class PopularTableViewCell: UITableViewCell {
    
    static let identifier = "PopularTableViewCell"
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    
    private let rankingLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 12)
        $0.textColor = .black
    }
    
    private let titleLabel = UILabel().then {
        $0.font = UIFont.boldSystemFont(ofSize: 14)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private let subTitleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.textColor = .gray
    }
    
    private let categoryLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .gray
    }
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.setTitleColor(.systemBlue, for: .normal)
        button.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        return button
    }()
    
    private let verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .top
        $0.distribution = .equalSpacing
        $0.spacing = 4
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 메서드는 구현되지 않았습니다.")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.numberOfLines = 2
        }
        
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
    }
    
    private func setUI() {
        [
            iconImageView,
            rankingLabel,
            verticalStackView,
            downloadButton
        ].forEach { addSubview($0) }
        
        [
            titleLabel,
            subTitleLabel,
            categoryLabel
        ].forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setLayout() {
         iconImageView.snp.makeConstraints {
             $0.centerY.equalToSuperview()
             $0.leading.equalToSuperview().offset(15)
             $0.size.equalTo(50) // 이미지 크기 조정
         }
         
         rankingLabel.snp.makeConstraints {
             $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
             $0.top.equalToSuperview().offset(12)
         }
         
         verticalStackView.snp.makeConstraints {
             $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
             $0.trailing.equalTo(downloadButton.snp.leading).offset(-10)
             $0.top.equalTo(rankingLabel)
             $0.bottom.lessThanOrEqualToSuperview().inset(12)
         }
         
         downloadButton.snp.makeConstraints {
             $0.centerY.equalToSuperview()
             $0.trailing.equalToSuperview().offset(-15)
             $0.width.equalTo(60)
             $0.height.equalTo(30)
         }
     }
    
    func configure(with app: App) {
        iconImageView.image = UIImage(named: app.iconImage)
        rankingLabel.text = "\(app.ranking)"
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        categoryLabel.text = app.category.rawValue
        
        switch app.downloadState {
        case .installed:
            downloadButton.setTitle("열기", for: .normal)
        case .update:
            downloadButton.setTitle("업데이트", for: .normal)
        case .download:
            downloadButton.setTitle("받기", for: .normal)
        case .redownload:
            downloadButton.setTitle("재다운로드", for: .normal)
        }
    }
}
