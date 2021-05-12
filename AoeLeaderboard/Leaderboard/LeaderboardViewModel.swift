//
//  LeaderboardViewModel.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import Foundation

protocol LeaderboardViewModelDelegate: AnyObject {
    func updateLeaderBoardProfiles(_ profiles: [LeaderboardProfileTableViewCell.Model])
    
    func showError()
}

final class LeaderboardViewModel {
    
    weak var delegate: LeaderboardViewModelDelegate?
    
    private let leaderboardProvider: LeaderboardProviding
    
    init(leaderboardProvider: LeaderboardProviding) {
        self.leaderboardProvider = leaderboardProvider
    }
    
    func getLeaderBoardProfiles() {
        leaderboardProvider.leaderboardProfiles { model in
            guard let model = model else {
                self.delegate?.showError()
                return
            }
            
            let profiles = model.leaderboardProfiles.map({ self.profile(model: $0) })
            
            self.delegate?.updateLeaderBoardProfiles(profiles)
        }
    }
    
    func profile(model: LeaderboardProfile) -> LeaderboardProfileTableViewCell.Model {
        
        let rank = "\(model.rank)"
        let rating = String(format: NSLocalizedString("leaderboard.rating", comment: ""), "\(model.rating)")
        let winrateRounded = calculatedWinrate(wins: Double(model.wins), games: Double(model.games))
        let winrate = String(format: NSLocalizedString("leaderboard.winrate", comment: ""), "\(winrateRounded)%")
        return .init(profileID: model.profileID, rank: rank, name: model.name, rating: rating, winrate: winrate)
    }
    
    func calculatedWinrate(wins: Double, games: Double) -> Int {
        return Int(round(wins * 100 / games))
    }
}
