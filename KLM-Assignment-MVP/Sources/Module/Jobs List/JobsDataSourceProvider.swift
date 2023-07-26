//
//  JobsDataSourceProvider.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/3/23.
//

import UIKit

struct JobsDataSourceProvider {
    typealias DataSource = UITableViewDiffableDataSource<Int, JobDTO>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, JobDTO>
    
    static func makeDataSource(for tableView: UITableView) -> DataSource {
        .init(tableView: tableView) { tableView, indexPath, job in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: JobsListCellView.reuseIdentifier,
                for: indexPath
            ) as? JobsListCellView else {
                NSLog("Failed to initialize JobsListCellView.")
                return UITableViewCell()
            }
            
            cell.selectionStyle = .none
            cell.configure(with: job)
            return cell
        }
    }
    
    static func applySnapshot(
        to dataSource: DataSource,
        with list: [JobDTO],
        _ animated: Bool = true
    ) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot, animatingDifferences: animated)
    }
}
