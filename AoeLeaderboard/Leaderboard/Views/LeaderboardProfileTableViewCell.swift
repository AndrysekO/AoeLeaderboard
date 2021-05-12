//
//  LeaderboardProfileTableViewCell.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class LeaderboardProfileTableViewCell: UITableViewCell {
    
    struct Model {
        let profileID: Int64
        let rank: String
        let name: String
        let rating: String
        let winrate: String
    }
    
    static let reuseIdentifier = String(describing: self)

    static let preferredHeight: CGFloat = 110
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .medium)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.subtitle, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let winrateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.subtitle, weight: .medium)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(rankLabel)
        addSubview(nameLabel)
        addSubview(ratingLabel)
        addSubview(winrateLabel)
        
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            rankLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.large),
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.small),
            rankLabel.widthAnchor.constraint(equalToConstant: 40),
            rankLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.large),
            nameLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: Spacing.small),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
            nameLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: Spacing.large),
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.4),
            ratingLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            winrateLabel.topAnchor.constraint(equalTo: rankLabel.bottomAnchor, constant: Spacing.large),
            winrateLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            winrateLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.4),
            winrateLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(with model: Model) {
        rankLabel.text = model.rank
        nameLabel.text = model.name
        ratingLabel.text = model.rating
        winrateLabel.text = model.winrate
    }
}
