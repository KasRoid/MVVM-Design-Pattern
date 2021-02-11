//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import SnapKit
import UIKit

final class ArticleTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "ArticleTableViewCell"
    
    final private let stackView = UIStackView()
    final private let titleLabel = UILabel()
    final private let descriptionLabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticleTableViewCell {
    func configure(title: String?, description: String?) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

// MARK: - UI
extension ArticleTableViewCell {
    final private func setUI() {
        setBasics()
        setLayouts()
    }
    final private func setBasics() {
        selectionStyle = .none
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .darkGray
        [titleLabel, descriptionLabel].forEach {
            $0.numberOfLines = 0
            stackView.addArrangedSubview($0)
        }
        
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 5
    }
    final private func setLayouts() {
        self.contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalTo(contentView).inset(12)
        }
    }
}

