//
//  SoccerStatus.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

// MARK: - Internal Enums
enum MatchesStatusCode: Int {
    case notStarted = 0
    case inplay = 1
    case halfTime = 11
    case extraTime = 12
    case penalties = 13
    case breakTime = 14
    case awarding = 15
    case updateLater = 2
    case ended = 3
    case afterPenalties = 31
    case afterExtraTime = 32
    case postponed = 4
    case cancelled = 5
    case abandoned = 6
    case interrupted = 7
    case suspended = 8
    case awarded = 9
    case delayed = 10
    case toBeAnnounced = 17
}
