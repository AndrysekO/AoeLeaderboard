//
//  LeaderboardDataSource.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import UIKit

final class LeaderboardDataSource: NSObject {
    
    var profiles = [LeaderboardProfileTableViewCell.Model]()
}

extension LeaderboardDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LeaderboardProfileTableViewCell.reuseIdentifier, for: indexPath
        ) as? LeaderboardProfileTableViewCell {
            let model = profiles[indexPath.row]
            cell.configure(with: model)
            return cell
        }
        
        return UITableViewCell()
    }
}
