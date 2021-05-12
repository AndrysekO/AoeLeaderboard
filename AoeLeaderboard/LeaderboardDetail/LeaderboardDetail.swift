//
//  LeaderboardDetail.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

struct LeaderboardDetail: Decodable {
    let lastMatch: LastMatch
    
    enum CodingKeys: String, CodingKey {
        case lastMatch = "last_match"
    }
}

struct LastMatch: Decodable {
    let name: String
    let mapType: Int
    let started: Int
    let finished: Int
    let players: [Player]
    
    enum CodingKeys: String, CodingKey {
        case name, started, finished, players
        case mapType = "map_type"
    }
}

struct Player: Decodable {
    let name: String
    let civilization: Int
    let hasWon: Bool
    
    enum CodingKeys: String, CodingKey {
        case name
        case civilization = "civ"
        case hasWon = "won"
    }
}
