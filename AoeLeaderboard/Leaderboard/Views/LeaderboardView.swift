//
//  LeaderboardView.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

protocol LeaderboardViewDelegate: AnyObject {
    func leaderboardViewDidPullToRefresh(_ view: UIView)
}

final class LeaderboardView: UIView {
    
    weak var delegate: LeaderboardViewDelegate?
    
    let refreshControl = UIRefreshControl()

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(tableView)
        
        tableView.register(
            LeaderboardProfileTableViewCell.self,
            forCellReuseIdentifier: LeaderboardProfileTableViewCell.reuseIdentifier
        )
        
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
        tableView.tableFooterView = UIView()
        
        refreshControl.beginRefreshing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        tableView.frame = bounds
    }
    
    @objc func didPullToRefresh() {
        delegate?.leaderboardViewDidPullToRefresh(self)
    }
    
}
