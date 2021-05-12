//
//  LeaderboardDetailViewModelTests.swift
//  AoeLeaderboardTests
//
//  Created by Ondrej Andrysek on 5/11/21.
//

import XCTest
@testable import AoeLeaderboard

class EmptyLeaderboardDetailProviding: LeaderboardDetailProviding {
    func leaderboardDetail(profileID: Int64, onResult: @escaping (LeaderboardDetail?) -> ()) {
        // Empty
    }
}

class LeaderboardDetailViewModelTests: XCTestCase {

    let viewModel = LeaderboardDetailViewModel(leaderboardDetailProvider: EmptyLeaderboardDetailProviding(), profileID: 0)
    
    func test_whenMatchDurationWas60Seconds_thenStringWillContain1Minute() {
        let text = viewModel.timeDurationText(start: 0, end: 60)
        XCTAssertEqual(text, "Time: 1 min")
    }
    
    func test_whenResponseIsValid_thenHeaderWillContainCorrectValues() {
        let model = viewModel.headerModel(model: .init(name: "Test", mapType: 1, started: 0, finished: 120, players: []))
        XCTAssertEqual(model.matchText, "Test")
        XCTAssertEqual(model.timeDurationText, "Time: 2 min")
        XCTAssertEqual(model.mapNameText, "Map type: 1")
    }
    
    func test_whenResponseIsValid_thenPlayerWillContainCorrectValues() {
        let model1 = viewModel.playerModels(player: .init(name: "Test1", civilization: 1, hasWon: true))
        let model2 = viewModel.playerModels(player: .init(name: "Test2", civilization: 2, hasWon: false))
        
        XCTAssertEqual(model1.name, "Test1")
        XCTAssertEqual(model1.civilization, "Civilization: 1")
        XCTAssertEqual(model1.result, "Has won")
        
        XCTAssertEqual(model2.name, "Test2")
        XCTAssertEqual(model2.civilization, "Civilization: 2")
        XCTAssertEqual(model2.result, "Has lost")
    }

}
