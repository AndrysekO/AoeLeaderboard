//
//  LeaderboardDetailTableHeaderView.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

class LeaderboardDetailTableHeaderView: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = String(describing: self)
    
    struct Model {
        let matchText: String
        let timeDurationText: String
        let mapNameText: String
    }

    private let matchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeDurationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mapNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: FontSize.title, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(matchLabel)
        addSubview(timeDurationLabel)
        addSubview(mapNameLabel)
        
        tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            matchLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            matchLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            matchLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
            matchLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            timeDurationLabel.topAnchor.constraint(equalTo: matchLabel.bottomAnchor, constant: Spacing.large),
            timeDurationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            timeDurationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
            timeDurationLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            mapNameLabel.topAnchor.constraint(equalTo: timeDurationLabel.bottomAnchor, constant: Spacing.large),
            mapNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            mapNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
            mapNameLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configure(with model: Model) {
        matchLabel.text = model.matchText
        timeDurationLabel.text = model.timeDurationText
        mapNameLabel.text = model.mapNameText
    }

}
