//
//  LeaderboardViewModelTests.swift
//  AoeLeaderboardTests
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import XCTest
@testable import AoeLeaderboard

class EmptyLeaderboardProvider: LeaderboardProviding {
    func leaderboardProfiles(onResult: @escaping (LeaderboardModel?) -> ()) {
        // Empty
    }
}

class LeaderboardViewModelTests: XCTestCase {
    
    let viewModel = LeaderboardViewModel(leaderboardProvider: EmptyLeaderboardProvider())

    func test_whenNumberOfWinsIsZero_thenWinrateIsZero() {
        let winrate = viewModel.calculatedWinrate(wins: 0, games: 100)
        XCTAssertEqual(winrate, 0)
    }
    
    func test_whenNumberOfWinsIs50AndNumberOfGamesIs10_thenWinrateIs50Percent() {
        let winrate = viewModel.calculatedWinrate(wins: 50, games: 100)
        XCTAssertEqual(winrate, 50)
    }

    func test_whenNumberOfWinsIs2AndNumberOfGamesIs3_thenWinrateIsRoundedUp() {
        let winrate = viewModel.calculatedWinrate(wins: 2, games: 3)
        XCTAssertEqual(winrate, 67)
    }
    
    func test_whenResponseIsValid_thenModelContainsCorrectValues() {
        let model = viewModel.profile(model: .init(profileID: 0, rank: 1, rating: 1000, name: "Test", games: 100, wins: 50))
        XCTAssertEqual(model.profileID, 0)
        XCTAssertEqual(model.rank, "1")
        XCTAssertEqual(model.rating, "Rating: 1000")
        XCTAssertEqual(model.name, "Test")
        XCTAssertEqual(model.winrate, "Winrate: 50%")
    }
}
