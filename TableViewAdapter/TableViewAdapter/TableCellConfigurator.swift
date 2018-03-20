//
//  TableCellConfigurator.swift
//  TableViewAdapter
//
//  Created by Atsushi Miyake on 2018/03/20.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import UIKit

struct TableCellConfigurator {
    var cell: UITableViewCell
    var height: CGFont
    var header: (view: UIView?, height: CGFloat)
    var footer: (view: UIView?, height: CGFloat)
}
