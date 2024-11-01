////
////  ViewController.swift
////  Toss
////
////  Created by 어진 on 10/21/24.
////
//
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//    
//    private let reviewView = ReviewView()
//    
//    private let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.showsVerticalScrollIndicator = true // 세로 스크롤 표시
//        return scrollView
//    }()
//    
//    private let contentView: UIView = {
//        let view = UIView()
//        return view
//    }()
//    
//    private let appIcon: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "tossIcon"))
//        imageView.layer.cornerRadius = 20
//        imageView.clipsToBounds = true
//        imageView.layer.borderWidth = 0.5
//        imageView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.9).cgColor
//        return imageView
//    }()
//    
//    private let appTitleStckView: UIStackView = {
//        let label = UILabel()
//        label.text = "토스"
//        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        
//        let appSubtitle = UILabel()
//        appSubtitle.text = "금융이 쉬워진다"
//        appSubtitle.font = UIFont.systemFont(ofSize: 14)
//        appSubtitle.textColor = .gray
//        
//        let stackView = UIStackView(arrangedSubviews: [label, appSubtitle])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .leading
//        return stackView
//    }()
//    
//    private let button: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("받기", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor.systemBlue
//        button.layer.cornerRadius = 15
//        return button
//    }()
//    
//    private let shareButton: UIButton = {
//        let button = UIButton(type: .system)
//        let iconImage = UIImage(systemName: "square.and.arrow.up")
//        button.setImage(iconImage, for: .normal)
//        return button
//    }()
//    
//    private let dividerTop: UIView = {
//        let view = UIView()
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
//        return view
//    }()
//    
//    private let ratingInfoStackView: UIStackView = {
//        let starLabel = UILabel()
//        starLabel.text = "8.4만개의 평가"
//        starLabel.font = UIFont.systemFont(ofSize: 14)
//        starLabel.textColor = .gray
//        
//        let ratingLabel = UILabel()
//        ratingLabel.text = "4.4"
//        ratingLabel.textColor = .gray
//        ratingLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
//        
//        // 별점 아이콘
//        let filledStar = UIImageView(image: UIImage(systemName: "star.fill"))
//        let filledStar2 = UIImageView(image: UIImage(systemName: "star.fill"))
//        let filledStar3 = UIImageView(image: UIImage(systemName: "star.fill"))
//        let filledStar4 = UIImageView(image: UIImage(systemName: "star.fill"))
//        let halfFilledStar = UIImageView(image: UIImage(systemName: "star.leadinghalf.filled")) // 덜 채워진 별
//        
//        let stars = [filledStar, filledStar2, filledStar3, filledStar4, halfFilledStar]
//        
//        stars.forEach {
//            $0.tintColor = .gray
//            $0.contentMode = .scaleAspectFit
//            $0.snp.makeConstraints { make in
//                make.width.height.equalTo(15) //별 사이즈 조정
//            }
//        }
//        
//        let ratingStackView = UIStackView(arrangedSubviews: stars)
//        ratingStackView.axis = .horizontal
//        ratingStackView.spacing = 4
//        ratingStackView.alignment = .center
//        
//        // 수직으로 starLabel, ratingLabel, ratingStackView 배치
//        let stackView = UIStackView(arrangedSubviews: [starLabel, ratingLabel, ratingStackView])
//        stackView.axis = .vertical
//        stackView.spacing = 8 // 각 요소 간의 간격
//        stackView.alignment = .center // 중앙 정렬
//        return stackView
//    }()
//    
//    private let verticalLeadingDivider: UIView = {
//        let view = UIView()
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
//        return view
//    }()
//    
//    private let prizeStackView: UIStackView = {
//        let iconImageView = UIImageView(image: UIImage(systemName: "trophy.fill"))
//        iconImageView.tintColor = .gray
//        iconImageView.contentMode = .scaleAspectFit
//        
//        let prizeLabel = UILabel()
//        prizeLabel.text = "수상"
//        prizeLabel.textColor = .gray
//        prizeLabel.font = UIFont.systemFont(ofSize: 14)
//        
//        let appLabel = UILabel()
//        appLabel.text = "에디터의 선택 앱"
//        appLabel.textColor = .gray
//        appLabel.font = UIFont.systemFont(ofSize: 14)
//        
//        let stackView = UIStackView(arrangedSubviews: [prizeLabel, iconImageView, appLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .center
//        return stackView
//    }()
//    
//    private let verticalTrailingDivider: UIView = {
//        let view = UIView()
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
//        return view
//    }()
//    
//    private let ageStackView: UIStackView = {
//        let ageLabel = UILabel()
//        ageLabel.text = "연령"
//        ageLabel.textColor = .gray
//        ageLabel.font = UIFont.systemFont(ofSize: 14)
//        
//        let numLabel = UILabel()
//        numLabel.text = "4+"
//        numLabel.textColor = .gray
//        numLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
//        
//        let korLabel = UILabel()
//        korLabel.text = "세"
//        korLabel.textColor = .gray
//        korLabel.font = UIFont.systemFont(ofSize: 14)
//        
//        let stackView = UIStackView(arrangedSubviews: [ageLabel, numLabel, korLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .center
//        return stackView
//    }()
//    
//    private let dividerBottom: UIView = {
//        let view = UIView()
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
//        return view
//    }()
//    
//    private lazy var issueButtonStack: UIStackView = {
//        let button = UIButton(type: .system)
//        button.setTitle("새로운 소식 ", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(openIssuePage), for: .touchUpInside)
//        
//        
//        let arrowImage = UIImage(systemName: "chevron.right")
//        button.setImage(arrowImage, for: .normal)
//        button.tintColor = .gray
//        button.contentHorizontalAlignment = .left
//        button.semanticContentAttribute = .forceRightToLeft
//        
//        let verLabel = UILabel()
//        verLabel.text = "버전 5.185.0"
//        verLabel.textColor = .gray
//        verLabel.font = UIFont.systemFont(ofSize: 13)
//        
//        let extraLabel = UILabel()
//        extraLabel.text = ". 구석구석 숨어있던 버그들을 잡았어요. 어쩌고 저쩌고"
//        extraLabel.textColor = .black
//        extraLabel.font = UIFont.systemFont(ofSize: 15)
//        
//        let stackView = UIStackView(arrangedSubviews: [button, verLabel, extraLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .fill
//        return stackView
//    }()
//    
//    private let previewStackView: UIStackView = {
//        // "미리 보기" 레이블 생성
//        let label = UILabel()
//        label.text = "미리 보기"
//        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        
//        // 스크롤 뷰 생성
//        let scrollView = UIScrollView()
//        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.isPagingEnabled = false
//        scrollView.bounces = true
//        scrollView.alwaysBounceHorizontal = true
//        
//        // 수평 스택 뷰 생성
//        let imageStackView = UIStackView()
//        imageStackView.axis = .horizontal
//        imageStackView.spacing = 10
//        imageStackView.alignment = .fill
//        imageStackView.distribution = .fill
//        
//        // 스크롤 뷰에 스택 뷰 추가
//        scrollView.addSubview(imageStackView)
//        imageStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//            make.height.equalToSuperview()
//        }
//        
//        // 미리보기 이미지 5개 추가
//        for i in 1...5 {
//            let imageView = UIImageView()
//            imageView.image = UIImage(named: "previewImage")
//            imageView.contentMode = .scaleAspectFit
//            imageView.layer.cornerRadius = 20
//            imageView.clipsToBounds = true
//            imageView.layer.borderWidth = 0.5
//            imageView.layer.borderColor = UIColor.lightGray.cgColor
//            
//            // 이미지 뷰의 크기 설정
//            imageView.snp.makeConstraints {
//                $0.width.equalTo(200)
//                $0.height.equalTo(imageView.snp.width).multipliedBy(19.5 / 9.0)
//            }
//            
//            imageStackView.addArrangedSubview(imageView)
//        }
//        
//        let containerStackView = UIStackView(arrangedSubviews: [label, scrollView])
//        containerStackView.axis = .vertical
//        containerStackView.spacing = 10
//        containerStackView.alignment = .fill
//        
//        // 스크롤 뷰의 높이 설정
//        scrollView.snp.makeConstraints { make in
//            make.height.equalTo(500)
//        }
//        
//        return containerStackView
//    }()
//    
//    
//    private let deviceStackView: UIStackView = {
//        let iconImageView = UIImageView(image: UIImage(systemName: "iphone"))
//        iconImageView.tintColor = .gray
//        iconImageView.contentMode = .scaleAspectFit
//        
//        let deviceLabel = UILabel()
//        deviceLabel.text = "iPhone"
//        deviceLabel.textColor = .gray
//        deviceLabel.font = UIFont.systemFont(ofSize: 14)
//        
//        let stackView = UIStackView(arrangedSubviews: [iconImageView, deviceLabel])
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        stackView.alignment = .center
//        
//        iconImageView.snp.makeConstraints { make in
//            make.width.height.equalTo(16)
//        }
//        
//        return stackView
//    }()
//    
//    private let dividerSecond: UIView = {
//        let view = UIView()
//        view.layer.borderWidth = 0.5
//        view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
//        return view
//    }()
//    
//    private let InfoStackView: UIStackView = {
//        let infoLabel = UILabel()
//        infoLabel.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다."
//        infoLabel.textColor = .black
//        infoLabel.font = UIFont.systemFont(ofSize: 12)
//        infoLabel.numberOfLines = 0
//        
//        let button = UIButton(type: .system)
//        button.setTitle("Ajin Park", for: .normal)
//        button.setTitleColor(.systemBlue, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        
//        let label = UILabel()
//        label.text = "개발자"
//        label.textColor = .gray
//        label.font = UIFont.systemFont(ofSize: 12)
//        
//        let arrowImage = UIImageView(image: UIImage(systemName: "chevron.right"))
//        arrowImage.tintColor = .lightGray
//        
//        let containerView = UIView()
//        containerView.addSubview(button)
//        containerView.addSubview(arrowImage)
//        
//        containerView.snp.makeConstraints {
//            $0.height.equalTo(30)
//        }
//        
//        button.snp.makeConstraints {
//            $0.leading.top.bottom.equalToSuperview()
//        }
//        
//        arrowImage.snp.makeConstraints {
//            $0.trailing.equalToSuperview().offset(-20)
//            $0.centerY.equalToSuperview()
//        }
//        
//        let stackView = UIStackView(arrangedSubviews: [infoLabel, containerView, label])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .fill
//        
//        return stackView
//    }()
//    
//    private lazy var reviewStackView: UIStackView = {
//        let button = UIButton(type: .system)
//        button.setTitle("평가 및 리뷰 ", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(openReviewPage), for: .touchUpInside)
//        
//        
//        let arrowImage = UIImage(systemName: "chevron.right")
//        button.setImage(arrowImage, for: .normal)
//        button.tintColor = .gray
//        button.contentHorizontalAlignment = .left
//        button.semanticContentAttribute = .forceRightToLeft
//        
//        let verLabel = UILabel()
//        verLabel.text = "4.4"
//        verLabel.textColor = .black
//        verLabel.font = UIFont.systemFont(ofSize: 70, weight: .bold)
//        
//        let extraLabel = UILabel()
//        extraLabel.text = "가장 도움이 되는 리뷰"
//        extraLabel.textColor = .black
//        extraLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        
//        
//        let stackView = UIStackView(arrangedSubviews: [button, verLabel, extraLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .fill
//        
//        return stackView
//    }()
//    
//    private let starContainerStackView: UIStackView = {
//        // 별점 아이콘
//        let filledStar = UIImageView(image: UIImage(systemName: "star.fill"))
//        let filledStar2 = UIImageView(image: UIImage(systemName: "star.fill"))
//        let filledStar3 = UIImageView(image: UIImage(systemName: "star.fill"))
//        let filledStar4 = UIImageView(image: UIImage(systemName: "star.fill"))
//        let halfFilledStar = UIImageView(image: UIImage(systemName: "star.leadinghalf.filled"))
//        
//        // StackView에 추가할 별들을 배열로 처리
//        let stars = [filledStar, filledStar2, filledStar3, filledStar4, halfFilledStar]
//        
//        stars.forEach {
//            $0.tintColor = .black
//            $0.contentMode = .scaleAspectFit
//            $0.snp.makeConstraints { make in
//                make.width.height.equalTo(20)
//            }
//        }
//        
//        let starLabel = UILabel()
//        starLabel.text = "8.4만개의 평가"
//        starLabel.textColor = .gray
//        starLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        
//        let starStackView = UIStackView(arrangedSubviews: stars)
//        starStackView.axis = .horizontal
//        starStackView.spacing = 4
//        starStackView.alignment = .center
//        
//        let stackView = UIStackView(arrangedSubviews: [starStackView, starLabel])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        
//        return stackView
//    }()
//    
//    //리뷰 박스
//    //    private let containerView: UIView = {
//    //        let view = UIView()
//    //        view.backgroundColor = .white // 박스 배경을 흰색으로 설정
//    //        view.layer.cornerRadius = 10  // 둥근 모서리 설정
//    //        view.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
//    //        view.layer.shadowOpacity = 0.2 // 그림자 투명도
//    //        view.layer.shadowOffset = CGSize(width: 0, height: 2) // 그림자 위치
//    //        view.layer.shadowRadius = 4 // 그림자 퍼짐 정도
//    //        view.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
//    //        view.layer.masksToBounds = false // 그림자가 제대로 보이게 설정
//    //        return view
//    //    }()
//    
//    private let feedbackStack: UIStackView = {
//        // "탭하여 평가하기" 레이블
//        let label = UILabel()
//        label.text = "탭하여 평가하기"
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//        label.textAlignment = .center  // 텍스트 가운데 정렬
//        
//        // 별점 아이콘 생성
//        let star1 = UIImageView(image: UIImage(systemName: "star"))
//        let star2 = UIImageView(image: UIImage(systemName: "star"))
//        let star3 = UIImageView(image: UIImage(systemName: "star"))
//        let star4 = UIImageView(image: UIImage(systemName: "star"))
//        let star5 = UIImageView(image: UIImage(systemName: "star"))
//        
//        let stars = [star1, star2, star3, star4, star5]
//        
//        stars.forEach {
//            $0.tintColor = .systemBlue  // 별 색깔
//            $0.contentMode = .scaleAspectFit
//            $0.snp.makeConstraints { make in
//                make.width.height.equalTo(25)  // 별 크기 설정
//            }
//        }
//        
//        // 별들을 담을 수평 스택뷰
//        let starStack = UIStackView(arrangedSubviews: stars)
//        starStack.axis = .horizontal
//        starStack.spacing = 5
//        starStack.alignment = .center
//        starStack.distribution = .equalSpacing
//        
//        // 전체 스택뷰에 레이블과 별 스택뷰 추가
//        let stackView = UIStackView(arrangedSubviews: [label, starStack])
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        stackView.alignment = .center
//        
//        return stackView
//    }()
//    
//    private let buttonStackView: UIStackView = {
//        // "리뷰 작성" 버튼 생성
//        let reviewButton = UIButton(type: .system)
//        reviewButton.setTitle("리뷰 작성", for: .normal)
//        reviewButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        reviewButton.setTitleColor(.systemBlue, for: .normal)
//        
//        // 리뷰 아이콘 설정
//        let reviewIcon = UIImage(systemName: "square.and.pencil")
//        reviewButton.setImage(reviewIcon, for: .normal)
//        reviewButton.tintColor = .systemBlue // 아이콘 색상 설정
//        
//        // 아이콘과 텍스트 위치 조정 (아이콘 왼쪽, 텍스트 오른쪽)
//        reviewButton.semanticContentAttribute = .forceLeftToRight
//        reviewButton.backgroundColor = UIColor.systemGray6
//        reviewButton.layer.cornerRadius = 10
//        reviewButton.layer.borderWidth = 1
//        reviewButton.layer.borderColor = UIColor.systemGray5.cgColor
//        
//        // "앱 지원" 버튼 생성
//        let supportButton = UIButton(type: .system)
//        supportButton.setTitle("앱 지원", for: .normal)
//        supportButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        supportButton.setTitleColor(.systemBlue, for: .normal)
//        
//        // 지원 아이콘 설정
//        let supportIcon = UIImage(systemName: "questionmark.circle")
//        supportButton.setImage(supportIcon, for: .normal)
//        supportButton.tintColor = .systemBlue // 아이콘 색상 설정
//        
//        // 아이콘과 텍스트 위치 조정 (아이콘 왼쪽, 텍스트 오른쪽)
//        supportButton.semanticContentAttribute = .forceLeftToRight
//        supportButton.backgroundColor = UIColor.systemGray6
//        supportButton.layer.cornerRadius = 10
//        supportButton.layer.borderWidth = 1
//        supportButton.layer.borderColor = UIColor.systemGray5.cgColor
//        
//        // 버튼들을 포함할 수평 스택뷰 생성
//        let stackView = UIStackView(arrangedSubviews: [reviewButton, supportButton])
//        stackView.axis = .horizontal
//        stackView.spacing = 20 // 버튼 간격 설정
//        stackView.alignment = .center
//        stackView.distribution = .fillEqually
//        
//        return stackView
//    }()
//    
//    //네비게이션으로 페이지로 이동
//    @objc func openReviewPage() {
//        let reviewVC = ReviewViewController()
//        navigationController?.pushViewController(reviewVC, animated: true)
//    }
//    
//    @objc func openIssuePage() {
//        let issueVC = issueViewController()
//        navigationController?.pushViewController(issueVC, animated: true)
//    }
//    
//    
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupUI()
//    }
//    
//    // MARK: - Setup UI
//    private func setupUI() {
//        view.addSubview(scrollView)
//        scrollView.addSubview(contentView)
//        
//        // ScrollView 제약 조건
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
//        }
//        
//        // ContentView 제약 조건
//        contentView.snp.makeConstraints { make in
//            make.edges.equalTo(scrollView.contentLayoutGuide)
//            make.width.equalTo(scrollView.frameLayoutGuide)
//            make.height.greaterThanOrEqualTo(scrollView.frameLayoutGuide).priority(.low)
//        }
//        
//        // 모든 UI 요소를 contentView에 추가
//        contentView.addSubview(appIcon)
//        contentView.addSubview(appTitleStckView)
//        contentView.addSubview(button)
//        contentView.addSubview(shareButton)
//        contentView.addSubview(dividerTop)
//        contentView.addSubview(ratingInfoStackView)
//        contentView.addSubview(dividerBottom)
//        contentView.addSubview(prizeStackView)
//        contentView.addSubview(ageStackView)
//        contentView.addSubview(verticalLeadingDivider)
//        contentView.addSubview(verticalTrailingDivider)
//        contentView.addSubview(issueButtonStack)
//        contentView.addSubview(previewStackView)
//        contentView.addSubview(dividerSecond)
//        contentView.addSubview(deviceStackView)
//        contentView.addSubview(InfoStackView)
//        contentView.addSubview(reviewStackView)
//        contentView.addSubview(starContainerStackView)
//        //        contentView.addSubview(containerView)
//        contentView.addSubview(reviewView)
//        contentView.addSubview(feedbackStack)
//        contentView.addSubview(buttonStackView)
//        
//        
//        
//        // 제약 조건
//        appIcon.snp.makeConstraints {
//            $0.top.equalTo(contentView.snp.top).offset(20)
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.width.height.equalTo(130)
//        }
//        
//        appTitleStckView.snp.makeConstraints {
//            $0.top.equalTo(appIcon.snp.top)
//            $0.leading.equalTo(appIcon.snp.trailing).offset(20)
//        }
//        
//        button.snp.makeConstraints {
//            $0.leading.equalTo(appTitleStckView.snp.leading)
//            $0.top.equalTo(appIcon.snp.bottom).offset(-30)
//            $0.width.equalTo(70)
//            $0.height.equalTo(30)
//        }
//        
//        shareButton.snp.makeConstraints {
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.centerY.equalTo(button.snp.centerY)
//        }
//        
//        dividerTop.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.top.equalTo(appIcon.snp.bottom).offset(20)
//            $0.height.equalTo(1)
//        }
//        
//        ratingInfoStackView.snp.makeConstraints {
//            $0.top.equalTo(dividerTop.snp.bottom).offset(10)
//            $0.leading.equalTo(contentView.snp.leading).offset(40)
//        }
//        
//        prizeStackView.snp.makeConstraints {
//            $0.top.equalTo(dividerTop.snp.bottom).offset(10)
//            $0.leading.equalTo(contentView.snp.leading).offset(180)
//        }
//        
//        ageStackView.snp.makeConstraints {
//            $0.top.equalTo(dividerTop.snp.bottom).offset(10)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-40)
//        }
//        
//        dividerBottom.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.top.equalTo(ratingInfoStackView.snp.bottom).offset(10)
//            $0.height.equalTo(1)
//        }
//        
//        verticalLeadingDivider.snp.makeConstraints {
//            $0.width.equalTo(1)
//            $0.leading.equalTo(ratingInfoStackView.snp.trailing).offset(20)
//            $0.top.equalTo(dividerTop.snp.bottom).offset(10)
//            $0.bottom.equalTo(dividerBottom.snp.top).offset(-10)
//        }
//        
//        verticalTrailingDivider.snp.makeConstraints {
//            $0.width.equalTo(1)
//            $0.leading.equalTo(prizeStackView.snp.trailing).offset(20)
//            $0.top.equalTo(dividerTop.snp.bottom).offset(10)
//            $0.bottom.equalTo(dividerBottom.snp.top).offset(-10)
//        }
//        
//        issueButtonStack.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.top.equalTo(dividerBottom.snp.bottom).offset(13)
//        }
//        
//        previewStackView.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.top.equalTo(issueButtonStack.snp.bottom).offset(25)
//        }
//        
//        deviceStackView.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.top.equalTo(previewStackView.snp.bottom).offset(20)
//        }
//        
//        dividerSecond.snp.makeConstraints {
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.top.equalTo(deviceStackView.snp.bottom).offset(30)
//            $0.height.equalTo(1)
//        }
//        
//        InfoStackView.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(20)
//            $0.trailing.equalToSuperview().offset(-20)
//            $0.top.equalTo(dividerSecond.snp.bottom).offset(10)
//        }
//        
//        reviewStackView.snp.makeConstraints{
//            $0.leading.equalTo(contentView.snp.leading).offset(20)
//            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            $0.top.equalTo(InfoStackView.snp.bottom).offset(60)
//        }
//        
//        starContainerStackView.snp.makeConstraints {
//            $0.trailing.equalTo(reviewStackView.snp.trailing).offset(-20)
//            $0.centerY.equalTo(reviewStackView.snp.centerY)
//        }
//        
//        //        containerView.snp.makeConstraints {
//        //            $0.leading.trailing.equalToSuperview().inset(20)
//        //            $0.top.equalTo(starContainerStackView.snp.bottom).offset(70)
//        //        }
//        
//        reviewView.snp.makeConstraints { make in
//            make.leading.equalTo(contentView.snp.leading).offset(20)
//            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
//            make.top.equalTo(reviewStackView.snp.bottom).offset(10)
//            make.height.equalTo(170)
//            
//        }
//        
//        
//        feedbackStack.snp.makeConstraints{
//            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.top.equalTo(reviewView.snp.bottom).offset(30)
//        }
//        
//        
//        
//        buttonStackView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.top.equalTo(feedbackStack.snp.bottom).offset(30)
//            $0.height.equalTo(50) // 높이를 크게 설정하여 버튼이 "통통"하게 보이도록
//            
//        }
//        
//        buttonStackView.arrangedSubviews.forEach { button in
//            button.snp.makeConstraints {
//                $0.height.equalTo(50)  // 버튼 높이를 크게 설정
//                $0.width.equalTo(150)  // 버튼 너비를 설정하여 "통통하게" 보이도록
//                $0.bottom.equalTo(contentView.snp.bottom).offset(-20) //마지막 요소에 넣어야돼!
//                
//            }
//        }
//    }
//}
