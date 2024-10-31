//
//  ReviewView.swift
//  Toss
//
//  Created by 어진 on 10/31/24.
//

import UIKit
import SnapKit

class ReviewView: UIView {
    
    private let reviewExamScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.alwaysBounceHorizontal = true
        scrollView.clipsToBounds = false // ScrollView가 클립하지 않도록 설정
        return scrollView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(reviewExamScrollView)
        reviewExamScrollView.addSubview(horizontalStackView)
        
        reviewExamScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(250)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        for _ in 1...5 {
            let reviewStack = createReviewStackView()
            horizontalStackView.addArrangedSubview(reviewStack)
            reviewStack.snp.makeConstraints { make in
                make.width.equalTo(360)
            }
        }
    }
    
    private func createReviewStackView() -> UIView {
        // containerView에 그림자와 스타일 적용
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.masksToBounds = false // 그림자가 잘리지 않도록 설정

        // stackView를 생성하고 containerView에 추가
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        let reviewTitleLabel = UILabel()
        reviewTitleLabel.text = "내일은 오토마타 시험"
        reviewTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        let ratingDateStackView = UIStackView()
        ratingDateStackView.axis = .horizontal

        let ratingLabel = UILabel()
        ratingLabel.text = "★★★★★"

        let dateLabel = UILabel()
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = .gray

        ratingDateStackView.addArrangedSubview(ratingLabel)
        ratingDateStackView.addArrangedSubview(dateLabel)

        let reviewContentLabel = UILabel()
        reviewContentLabel.text = """
        시험기간에 공부 안하고 과제하기 나름 재밌고 짜릿하다 공부해야되는데 계속 삐걱거리는 UI를 두고 갈 수가 없네 어떡해!!!!!!!!!!!!!!!!
        """
        reviewContentLabel.numberOfLines = 0
        reviewContentLabel.font = UIFont.systemFont(ofSize: 14)

        // stackView에 모든 요소 추가
        stackView.addArrangedSubview(reviewTitleLabel)
        stackView.addArrangedSubview(ratingDateStackView)
        stackView.addArrangedSubview(reviewContentLabel)

        // containerView에 stackView 추가
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10) // 내부 마진 추가
        }

        return containerView
    }
}
