//
//  FinanceViewController.swift
//  Toss
//
//  Created by 어진 on 11/1/24.
//

import UIKit
import SnapKit

class FinanceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FinanceAppTableViewCell.self, forCellReuseIdentifier: FinanceAppTableViewCell.identifier)
        tableView.register(AppSectionCell.self, forCellReuseIdentifier: AppSectionCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var essentialApps = App.sampleApps
    private var groupedApps: [[App]] = []
    
    private let sections: [(title: String, subtitle: String)] = [
        ("필수 금융 앱", "App Store 에디터가 직접 골랐습니다"),
        ("유료 앱", " "),
        ("무료 앱", " ")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        groupApps()
        setupTableView()
        setupTableHeader()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupTableHeader() {
        let headerView = FinanceHeaderCell()
        headerView.configure(with: App.sampleApps)
        headerView.frame.size = CGSize(width: view.frame.width, height: 300)

        tableView.tableHeaderView = headerView
    }
    
    private func groupApps() {
        groupedApps = stride(from: 0, to: essentialApps.count, by: 3).map {
            Array(essentialApps[$0..<min($0 + 3, essentialApps.count)])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count * 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let sectionIndex = indexPath.row / 2
            let section = sections[sectionIndex]
            
            guard let sectionCell = tableView.dequeueReusableCell(withIdentifier: AppSectionCell.identifier, for: indexPath) as? AppSectionCell else {
                return UITableViewCell()
            }
            sectionCell.configure(title: section.title, subtitle: section.subtitle)
            sectionCell.onArrowTapped = { [weak self] in
                let popularViewController = PopularViewController()
                self?.navigationController?.pushViewController(popularViewController, animated: true)
            }
            return sectionCell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FinanceAppTableViewCell.identifier, for: indexPath) as? FinanceAppTableViewCell else {
                return UITableViewCell()
            }
            cell.onAppSelected = { [weak self] app in
                if app.title == "토스" {
                    let tossDetailViewController = TossDetailViewController()
                    self?.navigationController?.pushViewController(tossDetailViewController, animated: true)
                }
            }
            cell.configure(with: groupedApps)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row % 2 == 0 ? 50 : 200
    }
    
    @objc private func handleButtonTap() {
        print("필수 금융 앱 버튼 클릭됨")
    }
}
