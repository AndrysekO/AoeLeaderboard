//
//  LeaderboardDetailViewController.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class LeaderboardDetailViewController: UIViewController {

    private let rootView = LeaderboardDetailView()
    
    private let dataSource = LeaderboardDetailDataSource()
    
    private let viewModel: LeaderboardDetailViewModel
    
    private var tableView: UITableView {
        return rootView.tableView
    }
    
    init(viewModel: LeaderboardDetailViewModel) {
        
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("leaderboardDetail.title", comment: "")
        
        viewModel.delegate = self
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        viewModel.getDetails()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
}

extension LeaderboardDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return LeaderboardDetailPlayerTableViewCell.preferredHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(
            withIdentifier: LeaderboardDetailTableHeaderView.reuseIdentifier
        ) as? LeaderboardDetailTableHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}

extension LeaderboardDetailViewController: LeaderboardDetailViewModelDelegate {
    
    func updateDetails(
        headerModel: LeaderboardDetailTableHeaderView.Model,
        players: [LeaderboardDetailPlayerTableViewCell.Model]
    ) {
        
        DispatchQueue.main.async { [weak self] in
            
            if let headerView = self?.tableView.headerView(forSection: 0) as? LeaderboardDetailTableHeaderView {
                headerView.configure(with: headerModel)
            }
            self?.dataSource.players = players
            self?.tableView.reloadData()
            self?.rootView.refreshControl.endRefreshing()
        }
    }
    
    func showError() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.backgroundView = ErrorView()
            self?.rootView.refreshControl.endRefreshing()
        }
    }
}
