//
//  TableViewAdapter.swift
//  TableViewAdapter
//
//  Created by Atsushi Miyake on 2018/03/20.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import UIKit

protocol TableViewAdapterDelegate {
    func numberOfRows() -> [Int]
    func tableView(at indexPath: IndexPath) -> TableCellConfigurator
}

final class TableViewAdapter: NSObject {

    var delegate: TableViewAdapterDelegate! = nil {
        didSet {
            self.rows = self.delegate.numberOfRows()
            // self.rows.enumerated().map { (section , row) in
            //     let indexPath = IndexPath(row: row, section: section)
            //     let configurator = self.delegate.tableView(at: indexPath)
            //     return [indexPath: configurator]
            // }
        }
    }

    private var configurators: [IndexPath: TableCellConfigurator] = [:]
    private var rows: [Int] = []
}

// MARK: - UITableViewDelegate
extension TableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let indexPath = IndexPath(row: 0, section: section)
        return self.configurators[indexPath]?.header.height ?? 0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let indexPath = IndexPath(row: 0, section: section)
        return self.configurators[indexPath]?.header.view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let indexPath = IndexPath(row: 0, section: section)
        return self.configurators[indexPath]?.footer.height ?? 0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let indexPath = IndexPath(row: 0, section: section)
        return self.configurators[indexPath]?.footer.view
    }
}

// MARK: - UITableViewDataSource
extension TableViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.configurators[indexPath] else { return UITableViewCell() }
        return cell
    }
}


