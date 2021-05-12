//
//  LeaderboardDetailViewModel.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

protocol LeaderboardDetailViewModelDelegate: AnyObject {
    func updateDetails(headerModel: LeaderboardDetailTableHeaderView.Model, players: [LeaderboardDetailPlayerTableViewCell.Model])
    
    func showError()
}

final class LeaderboardDetailViewModel {
    
    weak var delegate: LeaderboardDetailViewModelDelegate?
    
    private let leaderboardDetailProvider: LeaderboardDetailProviding
    
    private let profileID: Int64

    init(leaderboardDetailProvider: LeaderboardDetailProviding, profileID: Int64) {
        self.leaderboardDetailProvider = leaderboardDetailProvider
        self.profileID = profileID
    }
    
    func getDetails() {
        leaderboardDetailProvider.leaderboardDetail(profileID: profileID) { model in
            
            guard let details = model else {
                self.delegate?.showError()
                return
            }
            
            self.delegate?.updateDetails(
                headerModel: self.headerModel(model: details.lastMatch),
                players: details.lastMatch.players.map({ self.playerModels(player: $0) })
            )
        }
    }
    
    func headerModel(model: LastMatch) -> LeaderboardDetailTableHeaderView.Model {
        let timeDuration = timeDurationText(start: model.started, end: model.finished)
        return .init(
            matchText: model.name,
            timeDurationText: timeDuration,
            mapNameText: String(format: NSLocalizedString("leaderboardDetail.mapType", comment: ""), "\(model.mapType)")
        )
    }
    
    func playerModels(player: Player) -> LeaderboardDetailPlayerTableViewCell.Model {
        return .init(
            name: player.name,
            civilization: String(format: NSLocalizedString("leaderboardDetail.civilization", comment: ""), "\(player.civilization)"),
            result: player.hasWon
                ? NSLocalizedString("leaderboardDetail.hasWon", comment: "")
                : NSLocalizedString("leaderboardDetail.hasLost", comment: "")
        )
    }
    
    func timeDurationText(start: Int, end: Int) -> String {
        let difference = (end - start) / 60
        return String(format: NSLocalizedString("leaderboardDetail.timeDuration", comment: ""), "\(difference)")
    }
}
