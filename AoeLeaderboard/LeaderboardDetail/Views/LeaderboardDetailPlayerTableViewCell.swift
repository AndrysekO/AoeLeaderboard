//
//  LeaderboardDetailPlayerTableViewCell.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class LeaderboardDetailPlayerTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: self)
    
    static let preferredHeight: CGFloat = 90
    
    struct Model {
        let name: String
        let civilization: String
        let result: String
    }

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let civilizationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.subtitle, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hasWonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.subtitle, weight: .medium)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(civilizationLabel)
        addSubview(hasWonLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.medium),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
            nameLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            civilizationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Spacing.medium),
            civilizationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            civilizationLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.4),
            civilizationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            hasWonLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Spacing.medium),
            hasWonLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            hasWonLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.4),
            hasWonLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with model: Model) {
        nameLabel.text = model.name
        civilizationLabel.text = model.civilization
        hasWonLabel.text = model.result
    }

    
}
