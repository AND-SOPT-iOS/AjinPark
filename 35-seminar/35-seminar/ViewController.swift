//
//  ViewController.swift
//  35-seminar
//
//  Created by 어진 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .systemPink
        label.numberOfLines = 0 // 여러 줄 예측
        return label
    }()
    
    // 스위치 추가
    private let toggleSwitch: UISwitch = {
        let toggleSwitch = UISwitch()
        toggleSwitch.isOn = false
        return toggleSwitch
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 제목 여기에 써라."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 2
        textField.keyboardType = .default
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 10
        return textView
    }()
    
    // 다음 버튼 추가
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        return button
    }()
    
    // 전환 모드 버튼 추가
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton()
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTrapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        return button
    }()
    
    private var pushMode = true
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 설정
        setStyle()
        setUI()
        setLayout()
        
        // 배경색 설정
        view.backgroundColor = .white
        
        // 스위치 추가
        view.addSubview(toggleSwitch)
        
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toggleSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleSwitch.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -190)
        ])
        
        
        // 스위치 상태 변경 시 호출할 메서드 연결
        toggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
    }
    
    // MARK: - @objc Func
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    @objc func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .systemBlue // 스위치가 켜지면 배경색 변경
        } else {
            view.backgroundColor = .white // 스위치가 꺼지면 배경색 원래대로
        }
    }
    
    @objc func toggleButtonTrapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
    // MARK: - Private Func
    
    private func setStyle() {
        self.view.backgroundColor = .white
        updateUI()
    }
    
    private func setUI() {
        // 모든 UI 요소 배열에 추가
        [titleLabel, titleTextField, contentTextView, nextButton, pushModeToggleButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            contentTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView.heightAnchor.constraint(equalToConstant: 200),
            
            nextButton.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            
            pushModeToggleButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
            pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func updateUI() {
        // 전환 모드에 따라 라벨 텍스트 변경
        self.titleLabel.text = pushMode ? "옆으로 쓱 ⬅️" : "아래서 톡 ⬆️"
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        guard let title = titleTextField.text, let content = contentTextView.text else {
            return
        }
        
        nextViewController.dataBind(title: title, content: content)
        
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
}
