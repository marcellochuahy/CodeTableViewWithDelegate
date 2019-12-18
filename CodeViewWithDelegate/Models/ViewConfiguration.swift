//
//  ViewConfiguration.swift
//  CodeViewWithDelegate
//
//  Created by Marcello Chuahy on 17/12/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import Foundation

protocol ViewConfiguration: class {
    
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    
    // Chama os métodos acima na ordem pré-fixada
    func setupViewConfiguration()
}

extension ViewConfiguration {
    
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {
    }
    
}

