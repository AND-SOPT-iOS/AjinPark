//  PopularViewController.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//


import UIKit
import SnapKit

class PopularViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let scrollView = UIScrollView().then {
        $0.backgroundColor = .white // scrollView의 배경색을 흰색으로 설정하여 검은 화면 제거
    }
    
    private let contentView = UIView().then {
        $0.backgroundColor = .white // contentView의 배경색도 흰색으로 설정
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "인기 차트"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let items = ["무료 앱", "유료 앱"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        segmentedControl.selectedSegmentTintColor = .white
      
        return segmentedControl
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PopularTableViewCell.self, forCellReuseIdentifier: PopularTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100 // 예상 높이를 충분히 확보
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    private var savedItems = App.sampleApps // App 모델의 sampleApps 사용

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupLabels()
        setupSegmentedControl()
        setupTableView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
    }
    
    private func setupLabels() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20)
            make.leading.equalTo(contentView).offset(20)
        }
    }
    
    private func setupSegmentedControl() {
        contentView.addSubview(segmentControl)
        
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
    }
    
    private func setupTableView() {
        contentView.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // 테이블 뷰 제약 설정
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(CGFloat(savedItems.count) * 100)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularTableViewCell.identifier, for: indexPath) as? PopularTableViewCell else {
            return UITableViewCell()
        }
        
        let app = savedItems[indexPath.row]
        cell.configure(with: app)
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
