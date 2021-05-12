//
//  ErrorView.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class ErrorView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("errorMessage.unavailableData", comment: "")
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: FontSize.subtitle, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.4),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium)
        ])
    }
    
}
