//
//  APIManager.swift
//  AoeLeaderboard
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import Foundation

protocol LeaderboardProviding {
    func leaderboardProfiles(onResult: @escaping(LeaderboardModel?) -> ())
}

protocol LeaderboardDetailProviding {
    func leaderboardDetail(profileID: Int64, onResult: @escaping(LeaderboardDetail?) -> ())
}

final class APIService: LeaderboardProviding, LeaderboardDetailProviding {
    
    func leaderboardProfiles(onResult: @escaping (LeaderboardModel?) -> ()) {
        let urlString = "https://aoe2.net/api/leaderboard?game=aoe2de&leaderboard_id=3&start=1&count=20"
        sendRequest(urlString: urlString) { data in
            if let data = data as? Data, let leaderboardModel = try? JSONDecoder().decode(LeaderboardModel.self, from: data) {
                onResult(leaderboardModel)
            } else {
                onResult(nil)
            }
        }
    }
    
    func leaderboardDetail(profileID: Int64, onResult: @escaping (LeaderboardDetail?) -> ()) {
        let urlString = "https://aoe2.net/api/player/lastmatch?game=aoe2de&profile_id=\(profileID)"
        sendRequest(urlString: urlString) { data in
            if let data = data as? Data, let model = try? JSONDecoder().decode(LeaderboardDetail.self, from: data) {
                onResult(model)
            } else {
                onResult(nil)
            }
        }
    }
    
    private func sendRequest(urlString: String, onResult: @escaping(Any?) -> ()) {

        guard let url = URL(string: urlString) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            onResult(data)
        }.resume()
    }
    
}
