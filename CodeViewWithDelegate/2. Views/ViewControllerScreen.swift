//
//  ViewControllerScreen.swift
//  CodeViewWithDelegate
//
//  Created by Marcello Chuahy on 17/12/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit
import SnapKit

final class ViewControllerScreen: UIView {
    
    // MARK: - Properties
    var tableView = UITableView()
    var safeArea: UILayoutGuide!
    let customCellHeight: CGFloat = 66.0
    
    // MARK: - Data Source
    var items: [Product] = []
    
    // MARK: - Life cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ViewControllerScreen: ViewConfiguration {
    
    func buildViewHierarchy() {
        self.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        
        backgroundColor = .white
        safeArea = self.layoutMarginsGuide
        aditionalConfigurationForTableView()
        

    }
    
    func aditionalConfigurationForTableView() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
}

extension ViewControllerScreen: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.labelView.text = items[indexPath.row].name
        cell.switchViewDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return customCellHeight
    }
  
}

extension ViewControllerScreen: UITableViewDelegate {
    
}

extension ViewControllerScreen: SwitchViewDelegate {
    
    func tableViewCell(_ tableViewCell: UITableViewCell, switchWasTurnedOn: Bool) {
        print("⚠️ switchWasTurnedOn -> \(switchWasTurnedOn)")
    }
    
}
