//
//  FinanceHeaderCell.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//


import UIKit
import SnapKit

class FinanceHeaderCell: UITableViewCell {
    
    static let identifier = "FinanceHeaderCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 앱"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .systemBlue
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Elk - 여행 환율 변환기"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "언제 어디서나 간편한 환율 체크"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 370, height: 150)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var apps: [App] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 메서드는 구현되지 않았습니다.")
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(subtitleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel)
        }
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(FinanceAppGroupCollectionViewCell.self, forCellWithReuseIdentifier: FinanceAppGroupCollectionViewCell.identifier)
        
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configure(with apps: [App]) {
        self.apps = apps
        collectionView.reloadData()
    }
}

extension FinanceHeaderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count // apps의 개수로 변경
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinanceAppGroupCollectionViewCell.identifier, for: indexPath) as? FinanceAppGroupCollectionViewCell else {
            return UICollectionViewCell()
        }
        // apps의 특정 앱을 [App]로 변환하여 셀에 전달
        cell.configure(with: [apps[indexPath.row]]) // 수정된 부분
        return cell
    }
}
