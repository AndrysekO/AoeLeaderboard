//
//  LeaderboardModel.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

struct LeaderboardModel: Decodable {
    let leaderboardProfiles: [LeaderboardProfile]
    
    enum CodingKeys: String, CodingKey {
        case leaderboardProfiles = "leaderboard"
    }
}

struct LeaderboardProfile: Decodable {
    let profileID: Int64
    let rank: Int
    let rating: Int
    let name: String
    let games: Int
    let wins: Int
    
    enum CodingKeys: String, CodingKey {
        case profileID = "profile_id"
        case rank, rating, name, games, wins
    }
}
