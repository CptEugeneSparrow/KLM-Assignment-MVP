//
//  JobDetailsViewController.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/3/23.
//

import UIKit

final class JobDetailsViewController: UIViewController {
    private enum Constants {
        enum Layout {
            static let inset: CGFloat = 8
        }
    }
    
    // MARK: - Properties
    
    private let viewModel: JobDetailsViewModel
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let dateLabel = UILabel()
    
    // MARK: - Init

    init(viewModel: JobDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods

    private func setupUI() {
        view.backgroundColor = .white
        setupScrollView()
        setupStackView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupDateLabel()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Layout.inset),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Layout.inset),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.Layout.inset),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.Layout.inset)
        ])
    }
    
    private func setupStackView() {
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabel.font = FontProvider.titleBold
        titleLabel.numberOfLines = 0
        titleLabel.text = viewModel.jobDetailsTitleString
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.font = FontProvider.bodyMedium
        descriptionLabel.numberOfLines = 0
        descriptionLabel.attributedText = viewModel.jobDescriptionAttributedString
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupDateLabel() {
        dateLabel.font = FontProvider.bodyMedium
        dateLabel.text = viewModel.jobDateOfCreationsString
        stackView.addArrangedSubview(dateLabel)
    }
}
