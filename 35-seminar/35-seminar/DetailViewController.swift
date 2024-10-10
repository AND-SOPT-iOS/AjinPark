//
//  DetailViewController.swift
//  35-seminar
//
//  Created by 어진 on 10/5/24.
//

import UIKit
//넘어간 화면, 네비게이션 푸시 됐을 때 뜨는 화면



class DetailViewController: UIViewController {
    
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .semibold)
    return label
  }()
  
    private var contentLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12, weight: .regular)
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 10
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        return button
    }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setStyle()
    setUI()
    setLayout()
  }
    
    
    private var receivedTitle: String?
    private var receviedContent: String?
  
  private func setStyle() {
      self.view.backgroundColor = .white
  }
  
  private func setUI() {
    [titleLabel, contentLabel, backButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.view.addSubview($0)
    }
  }
  
  private func setLayout() {
    NSLayoutConstraint.activate(
      [
        titleLabel.topAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.topAnchor,
          constant: 20
        ),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        contentLabel.topAnchor.constraint(
          equalTo: titleLabel.bottomAnchor,
          constant: 20
        ),
        contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backButton.topAnchor.constraint(
          equalTo: contentLabel.bottomAnchor,
          constant: 20
        ),
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backButton.heightAnchor.constraint(equalToConstant: 44),
        backButton.widthAnchor.constraint(equalToConstant: 300),
      ]
    )
  }
    
    func updateUI(){ // 전달 받은 걸 띄우는 함수
        self.titleLabel.text = receivedTitle
        self.contentLabel.text =  receviedContent
    }//받아오는 값을 이용하는 함수 
    
    func dataBind( //전달 받는 함수
        title: String,
        content: String
    ){
        self.receivedTitle = title
        self.receviedContent = content
        updateUI() //ui업데이트해주기
    }// 내가 어떤 값을 받아와야하는지 정의하는 함수, 받아올 떄 쓴다
    //뷰컨에서 쓴 값을 파라미터에 넣어준 것
    //하나의 틀이다


  @objc func backButtonTapped() {
    if self.navigationController == nil {
      self.dismiss(animated: true)
    } else {
      self.navigationController?.popViewController(animated: true)
    }
  }
}

