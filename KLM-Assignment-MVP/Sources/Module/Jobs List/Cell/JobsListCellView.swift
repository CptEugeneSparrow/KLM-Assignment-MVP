//
//  JobsListCellView.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/3/23.
//

import UIKit

final class JobsListCellView: UITableViewCell {
    private enum Constants {
        enum Shadow {
            static let shadowColor = UIColor.darkGray.cgColor
            static let shadowOpacity: Float = 0.3
            static let shadowOffset = CGSize(width: 0, height: 4)
            static let shadowRadius: CGFloat = 9
        }
        
        enum Layout {
            static let inset: CGFloat = 8
        }
    }
    
    private let companyNameLabel = UILabel()
    private let titleLabel = UILabel()
    private let cityNameLabel = UILabel()
    private let stackView = UIStackView()
    private let wrapView = UIView()
    private let contentShadowLayer = CAShapeLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(
            roundedRect: contentView.bounds.insetBy(dx: 10, dy: 10),
            cornerRadius: 8
        )
        contentShadowLayer.path = path.cgPath
        contentShadowLayer.shadowPath = contentShadowLayer.path
    }
    
    func configure(with dto: JobDTO) {
        companyNameLabel.text = dto.companyName
        titleLabel.text = dto.title
        cityNameLabel.text = dto.location
    }
    
    private func setupUI() {
        setupShapeLayer()
        setupShadow()
        setupWrapView()
        setupStackView()
        setupCompanyNameLabel()
        setupTitleLabel()
        setupCityNameLabel()
    }
    
    private func setupWrapView() {
        wrapView.backgroundColor = .white
        wrapView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(wrapView)
        NSLayoutConstraint.activate([
            wrapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Layout.inset),
            wrapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Layout.inset),
            wrapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Layout.inset),
            wrapView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Layout.inset)
        ])
    }
    
    private func setupStackView() {
        wrapView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: wrapView.leadingAnchor, constant: Constants.Layout.inset),
            stackView.trailingAnchor.constraint(equalTo: wrapView.trailingAnchor, constant: -Constants.Layout.inset),
            stackView.bottomAnchor.constraint(equalTo: wrapView.bottomAnchor, constant: -Constants.Layout.inset),
            stackView.topAnchor.constraint(equalTo: wrapView.topAnchor, constant: Constants.Layout.inset)
        ])
    }
    
    private func setupCompanyNameLabel() {
        companyNameLabel.font = FontProvider.bodyMedium
        stackView.addArrangedSubview(companyNameLabel)
    }
    
    private func setupTitleLabel() {
        titleLabel.font = FontProvider.titleBold
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupCityNameLabel() {
        cityNameLabel.font = FontProvider.bodyMedium
        stackView.addArrangedSubview(cityNameLabel)
    }
    
    private func setupShapeLayer() {
        wrapView.layer.cornerRadius = 8
        wrapView.layer.masksToBounds = true
    }
    
    private func setupShadow() {
        contentView.layer.insertSublayer(contentShadowLayer, at: 0)
        contentShadowLayer.shadowColor = Constants.Shadow.shadowColor
        contentShadowLayer.shadowOpacity = Constants.Shadow.shadowOpacity
        contentShadowLayer.shadowOffset = Constants.Shadow.shadowOffset
        contentShadowLayer.shadowRadius = Constants.Shadow.shadowRadius
    }
}
