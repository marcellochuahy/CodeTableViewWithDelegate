//
//  CustomTableViewCell.swift
//  CodeViewWithDelegate
//
//  Created by Marcello Chuahy on 17/12/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit
import SnapKit

final class CustomTableViewCell: UITableViewCell {
    
    weak var switchViewDelegate: SwitchViewDelegate?

    // MARK: - Properties (Views)
    lazy var contentCellView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy var labelView: UILabel = {
        let view = UILabel(frame: .zero)
        return view
    }()
    
    lazy var switchView: UISwitch = {
        let view = UISwitch(frame: .zero)
        return view
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: ViewCode
extension CustomTableViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        self.addSubview(contentCellView)
        contentCellView.addSubview(labelView)
        contentCellView.addSubview(switchView)
    }
    
    func setupConstraints() {
        
        contentCellView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        labelView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.right.equalTo(switchView.snp.left).offset(-16)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        switchView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
    }
    
    func configureViews() {
        
        contentCellView.backgroundColor = .white
        
        configureTextColors()
        configureFonts()
        setupAcessibility()
        
        switchView.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
    }
    
    @objc
    func switchValueDidChange(_ sender: UISwitch!) {
        switchViewDelegate?.tableViewCell(self, switchWasTurnedOn: sender.isOn)
    }

}

// MARK: Text Colors
extension CustomTableViewCell {
    func configureTextColors() {
        labelView.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    }
}

// MARK: Font
extension CustomTableViewCell {
    func configureFonts() {
        labelView.font = UIFont(name:"Helvetica Neue", size: 18)
    }
}

// MARK: Acessibility
extension CustomTableViewCell: AcessibilityProtocol {
    
    func setupAcessibility() {
        labelView.isAccessibilityElement = false
        labelView.accessibilityTraits = UIAccessibilityTraits.staticText
        labelView.accessibilityLabel = ""
    }
}
