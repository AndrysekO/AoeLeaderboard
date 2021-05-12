//
//  LeaderboardDetailDataSource.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class LeaderboardDetailDataSource: NSObject {
    
    var players = [LeaderboardDetailPlayerTableViewCell.Model]()
}

extension LeaderboardDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: LeaderboardDetailPlayerTableViewCell.reuseIdentifier, for: indexPath
        ) as? LeaderboardDetailPlayerTableViewCell {
            
            let player = players[indexPath.row]
            cell.configure(with: player)
            
            return cell
        }
        
        return UITableViewCell()
    }
}
