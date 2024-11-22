//
//  RegisterView.swift
//  Toss
//
//  Created by 어진 on 11/2/24.
//

import UIKit
import SnapKit
import Alamofire

class RegisterView: UIView {
    
    var onRegisterButtonTapped: (() -> Void)?
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "      예) 나는야 오딩"
        textField.layer.cornerRadius = 15
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 11)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "      여기에 비밀번호를 치면 된담"
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 11)
        return textField
    }()
    
    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "      취미를 입력해 주세요"
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 11)
        return textField
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입 성공 여부"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 15
            return imageView
        }()
        
        if let image = UIImage(named: "tossIcon") {
            imageView.image = image
        }
        addSubview(imageView)
        
        let idLabel: UILabel = {
            let label = UILabel()
            label.text = "유저 이름을 입력해라"
            label.font = UIFont.systemFont(ofSize: 11)
            label.textColor = .white
            return label
        }()
        addSubview(idLabel)
        
        addSubview(idTextField)
        
        let passwordLabel: UILabel = {
            let label = UILabel()
            label.text = "비밀번호를 입력해보겠니?"
            label.font = UIFont.systemFont(ofSize: 11)
            label.textColor = .white
            return label
        }()
        addSubview(passwordLabel)
        
        addSubview(passwordTextField)
        
        let hobbyLabel: UILabel = {
            let label = UILabel()
            label.text = "취미를 입력해 주세요"
            label.font = UIFont.systemFont(ofSize: 11)
            label.textColor = .white
            return label
        }()
        addSubview(hobbyLabel)
        
        addSubview(hobbyTextField)
        
        let registerButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("회원가입", for: .normal)
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 10
            button.addTarget(self, action: #selector(handleRegisterButtonTapped), for: .touchUpInside)
            return button
        }()
        addSubview(registerButton)
        
        addSubview(resultLabel)
                
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).offset(126)
            make.width.equalTo(287)
            make.height.equalTo(75)
        }
        
        idLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(idTextField)
            make.top.equalTo(imageView.snp.bottom).offset(40)
        }
        
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idLabel.snp.bottom).offset(5)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(idTextField)
            make.top.equalTo(idTextField.snp.bottom).offset(15)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        hobbyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalTo(hobbyTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
        }
        
        hobbyTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hobbyLabel.snp.bottom).offset(5)
            make.width.equalTo(300)
            make.height.equalTo(35)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(15)
            make.width.equalTo(300)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleRegisterButtonTapped() {
        let userService = UserService()
        userService.register(
            username: idTextField.text ?? "",
            password: passwordTextField.text ?? "",
            hobby: hobbyTextField.text ?? ""
        ) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                var text: String
                switch result {
                case .success:
                    text = "회원가입 성공했어요."
                case let .failure(error):
                    text = error.errorMessage
                }
                self.resultLabel.text = text
            }
        }
    }
}


//import UIKit
//import SnapKit
//import Alamofire
//
//class LoginView: UIView {
//    
//    var onLoginButtonTapped: (() -> Void)?
//    
//    private let idTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "      예) 나는야 오딩"
//        textField.layer.cornerRadius = 15
//        textField.clipsToBounds = true
//        textField.layer.borderWidth = 1.0
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.font = UIFont.systemFont(ofSize: 11)
//        return textField
//    }()
//    
//    private let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "      여기에 비밀번호를 치면 된담"
//        textField.isSecureTextEntry = true
//        textField.layer.cornerRadius = 15
//        textField.layer.borderWidth = 1.0
//        textField.layer.borderColor = UIColor.lightGray.cgColor
//        textField.font = UIFont.systemFont(ofSize: 11)
//        return textField
//    }()
//    
//    private let resultLabel: UILabel = {
//        let label = UILabel()
//        label.text = "로그인 성공 여부"
//        label.font = UIFont.systemFont(ofSize: 13)
//        label.textColor = .white
//        label.textAlignment = .center
//        return label
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = .systemBlue
//        
//        let imageView: UIImageView = {
//            let imageView = UIImageView()
//            imageView.contentMode = .scaleAspectFit
//            imageView.layer.cornerRadius = 15
//            return imageView
//        }()
//        
//        if let image = UIImage(named: "tossIcon") {
//            imageView.image = image
//        }
//        addSubview(imageView)
//        
//        let idLabel: UILabel = {
//            let label = UILabel()
//            label.text = "유저 이름을 입력해라"
//            label.font = UIFont.systemFont(ofSize: 11)
//            label.textColor = .white
//            return label
//        }()
//        addSubview(idLabel)
//        
//        addSubview(idTextField)
//        
//        let passwordLabel: UILabel = {
//            let label = UILabel()
//            label.text = "비밀번호를 입력해보겠니?"
//            label.font = UIFont.systemFont(ofSize: 11)
//            label.textColor = .white
//            return label
//        }()
//        addSubview(passwordLabel)
//        
//        addSubview(passwordTextField)
//        
//        let loginButton: UIButton = {
//            let button = UIButton(type: .system)
//            button.setTitle("로그인", for: .normal)
//            button.backgroundColor = .black
//            button.setTitleColor(.white, for: .normal)
//            button.layer.cornerRadius = 10
//            button.addTarget(self, action: #selector(handleLoginButtonTapped), for: .touchUpInside)
//            return button
//        }()
//        addSubview(loginButton)
//        
//        addSubview(resultLabel)
//                
//        imageView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(self.safeAreaLayoutGuide).offset(126)
//            make.width.equalTo(287)
//            make.height.equalTo(75)
//        }
//        
//        idLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.leading.equalTo(idTextField)
//            make.top.equalTo(imageView.snp.bottom).offset(40)
//        }
//        
//        idTextField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(idLabel.snp.bottom).offset(5)
//            make.width.equalTo(300)
//            make.height.equalTo(35)
//        }
//        
//        passwordLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.leading.equalTo(idTextField)
//            make.top.equalTo(idTextField.snp.bottom).offset(15)
//        }
//        
//        passwordTextField.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
//            make.width.equalTo(300)
//            make.height.equalTo(35)
//        }
//        
//        loginButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
//            make.width.equalTo(300)
//            make.height.equalTo(40)
//        }
//        
//        resultLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(loginButton.snp.bottom).offset(15)
//            make.width.equalTo(300)
//            make.height.equalTo(20)
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func handleLoginButtonTapped() {
//        let userService = UserService()
//        userService.login(
//            username: idTextField.text ?? "",
//            password: passwordTextField.text ?? ""
//        ) { [weak self] result in
//            DispatchQueue.main.async {
//                guard let self = self else { return }
//                
//                var text: String
//                switch result {
//                case .success:
//                    text = "로그인 성공했어요."
//                case let .failure(error):
//                    text = error.errorMessage
//                }
//                self.resultLabel.text = text
//            }
//        }
//    }
//
//}
