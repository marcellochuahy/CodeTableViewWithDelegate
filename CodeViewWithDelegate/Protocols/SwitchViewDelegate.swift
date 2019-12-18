//
//  SwitchViewDelegate.swift
//  CodeViewWithDelegate
//
//  Created by Marcello Chuahy on 18/12/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit

protocol SwitchViewDelegate: class {
    func tableViewCell(_ tableViewCell: UITableViewCell, switchWasTurnedOn: Bool)
}
