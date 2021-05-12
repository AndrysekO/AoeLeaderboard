//
//  LeaderboardDetailView.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class LeaderboardDetailView: UIView {
    
    let refreshControl = UIRefreshControl()

    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(tableView)
        
        tableView.register(
            LeaderboardDetailTableHeaderView.self,
            forHeaderFooterViewReuseIdentifier: LeaderboardDetailTableHeaderView.reuseIdentifier
        )
        
        tableView.register(
            LeaderboardDetailPlayerTableViewCell.self,
            forCellReuseIdentifier: LeaderboardDetailPlayerTableViewCell.reuseIdentifier
        )
        
        tableView.backgroundColor = .white
        
        tableView.addSubview(refreshControl)
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        
        refreshControl.beginRefreshing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        tableView.frame = bounds
    }
    
}
