//
//  LeaderboardViewController.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

protocol LeaderboardViewControllerDelegate: AnyObject {
    func leaderboardViewController(_ viewController: LeaderboardViewController, didSelect profileID: Int64)
}

final class LeaderboardViewController: UIViewController {
    
    weak var delegate: LeaderboardViewControllerDelegate?

    private let rootView = LeaderboardView()
    
    private let dataSource = LeaderboardDataSource()
    
    private let viewModel: LeaderboardViewModel
    
    private var tableView: UITableView {
        return rootView.tableView
    }
    
    init(viewModel: LeaderboardViewModel) {
        
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("leaderboard.title", comment: "")
        
        self.viewModel.delegate = self
        rootView.delegate = self
        
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        viewModel.getLeaderBoardProfiles()
    }
    
    override func loadView() {
        view = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LeaderboardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LeaderboardProfileTableViewCell.preferredHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataSource.profiles[indexPath.row]
        
        delegate?.leaderboardViewController(self, didSelect: model.profileID)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension LeaderboardViewController: LeaderboardViewModelDelegate {
    
    func updateLeaderBoardProfiles(_ profiles: [LeaderboardProfileTableViewCell.Model]) {
        
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.profiles = profiles
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

extension LeaderboardViewController: LeaderboardViewDelegate {
    func leaderboardViewDidPullToRefresh(_ view: UIView) {
        viewModel.getLeaderBoardProfiles()
    }
}

