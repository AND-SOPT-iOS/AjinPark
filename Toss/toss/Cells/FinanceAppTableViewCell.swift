//
//  FinanceAppTableViewCell.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit
import SnapKit

class FinanceAppTableViewCell: UITableViewCell {
    
    static let identifier = "FinanceAppTableViewCell"
    
    var onAppSelected: ((App) -> Void)?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 200)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private var groupedApps: [[App]] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 메서드는 구현되지 않았습니다.")
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FinanceAppGroupCollectionViewCell.self, forCellWithReuseIdentifier: FinanceAppGroupCollectionViewCell.identifier)
        
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(200)
        }
    }
    
    func configure(with groupedApps: [[App]]) {
        self.groupedApps = groupedApps
        collectionView.reloadData()
    }
}

extension FinanceAppTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupedApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinanceAppGroupCollectionViewCell.identifier, for: indexPath) as? FinanceAppGroupCollectionViewCell else {
            fatalError("Error")
        }
        cell.configure(with: groupedApps[indexPath.row])
        return cell
    }
}

extension FinanceAppTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedApps = groupedApps[indexPath.row]
        for app in selectedApps {
            if app.title == "토스" {
                onAppSelected?(app) //화면 이동 토스로
            }
        }
    }
}
