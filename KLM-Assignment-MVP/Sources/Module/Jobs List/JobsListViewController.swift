//
//  JobsListViewController.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import UIKit

protocol JobsListViewControllerDelegate: AnyObject {
    func jobsListViewController(_ viewController: JobsListViewController, didSelectElement element: JobDTO)
}

final class JobsListViewController: UIViewController {
    // MARK: - Properties

    weak var delegate: JobsListViewControllerDelegate?
    
    private lazy var dataSource = JobsDataSourceProvider.makeDataSource(for: tableView)
    
    private let viewModel: JobsListViewModel
    
    private let tableView = UITableView()
    
    // MARK: - Init

    init(viewModel: JobsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private methods

    private func setup() {
        title = "Jobs"
        bind(to: viewModel)
        setupUI()
    }
    
    private func bind(to viewModel: JobsListViewModel) {
        viewModel.onUpdate = { [weak self] jobs in
            guard let self else { return }
            JobsDataSourceProvider.applySnapshot(
                to: self.dataSource,
                with: jobs
            )
        }
        
        viewModel.onError = { [weak self] in
            guard let self else { return }
            self.presentErrorAlert(on: self)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.register(
            JobsListCellView.self,
            forCellReuseIdentifier: JobsListCellView.reuseIdentifier
        )
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDelegate

extension JobsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.jobsListViewController(self, didSelectElement: viewModel.dataSource[indexPath.row])
    }
}
