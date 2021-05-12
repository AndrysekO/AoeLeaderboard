//
//  MainCoordinator.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class MainCoordinator {
    
    let navigationController: UINavigationController
    
    private let apiService = APIService()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        let initialController = LeaderboardViewController(viewModel: LeaderboardViewModel(leaderboardProvider: apiService))
        initialController.delegate = self
        navigationController.pushViewController(initialController, animated: true)
    }
}

extension MainCoordinator: LeaderboardViewControllerDelegate {
    func leaderboardViewController(_ viewController: LeaderboardViewController, didSelect profileID: Int64) {
        
        let viewModel = LeaderboardDetailViewModel(leaderboardDetailProvider: apiService, profileID: profileID)
        
        let viewController = LeaderboardDetailViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
