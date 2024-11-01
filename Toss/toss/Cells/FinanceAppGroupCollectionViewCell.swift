//
//  FinanceAppGroupCollectionViewCell.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit
import SnapKit

class FinanceAppGroupCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FinanceAppGroupCollectionViewCell"
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 15
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(stackView)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    func configure(with apps: [App]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for app in apps {
            let appView = createAppView(for: app)
            stackView.addArrangedSubview(appView)
        }
    }
    
    private func createAppView(for app: App) -> UIView {
        let containerView = UIView()
        
        let iconImageView = UIImageView().then {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.image = UIImage(named: app.iconImage)
        }
        
        let titleLabel = UILabel().then {
            $0.font = UIFont.boldSystemFont(ofSize: 14)
            $0.textColor = .black
            $0.text = app.title
        }
        
        let subtitleLabel = UILabel().then {
            $0.font = UIFont.systemFont(ofSize: 12)
            $0.textColor = .gray
            $0.text = app.subTitle
        }
        
        let downloadButton = UIButton(type: .system).then {
            $0.setTitle("받기", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
            $0.layer.cornerRadius = 12
        }
        
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(downloadButton)
        
        iconImageView.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.size.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.equalTo(titleLabel)
        }
        
        downloadButton.snp.makeConstraints { make in
            make.trailing.centerY.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(24)
        }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return containerView
    }
}
