//
//  AppSectionView.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit
import SnapKit

// 재사용 가능한 컴포넌트 추가
class AppSectionView: UIView {

    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.right"))

    var onArrowTapped: (() -> Void)? // 화살표 클릭 시 호출될 클로저

    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        setupView(title: title, subtitle: subtitle)
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) 메서드는 구현되지 않았습니다.")
    }

    private func setupView(title: String, subtitle: String) {
        backgroundColor = .white

        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.textColor = .black

        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.textColor = .gray

        arrowImageView.tintColor = .black

        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(arrowImageView)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-10)
        }

        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(arrowTapped))
        arrowImageView.isUserInteractionEnabled = true
        arrowImageView.addGestureRecognizer(tapGesture)
    }

    @objc private func arrowTapped() {
        onArrowTapped?() // 클로저 호출
    }
}
