//
//  ViewController.swift
//  CodeViewWithDelegate
//
//  Created by Marcello Chuahy on 17/12/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let screen = ViewControllerScreen()
    
    // MARK: - Life cycle
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataSource()
    }
    
    // MARK: - Methods
    
    func setDataSource() {
        screen.items.append(Product(name: "Alpha"))
        screen.items.append(Product(name: "Bravo"))
        screen.items.append(Product(name: "Charlie"))
        screen.items.append(Product(name: "Delta"))
        screen.items.append(Product(name: "Fox"))
        screen.items.append(Product(name: "Golf"))
    }
    
}
