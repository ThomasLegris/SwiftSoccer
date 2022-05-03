//
//  ScorersCodable.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// Codable response for league scorers request.
struct ScorersCodable: Codable {
    var data: [Scorer]

    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - Internal Structs
extension ScorersCodable {
    /// `data` field in API scorers list response.
    struct Scorer: Codable {
        var pos: Int
        var player: Player
        var team: Team
        var matchesPlayed: Int
        var goals: Goals

        enum CodingKeys: String, CodingKey {
            case pos
            case player
            case team
            case matchesPlayed = "matches_played"
            case goals
        }
    }

    /// A player object used in Scorer object.
    struct Player: Codable {
        var playerId: Int
        var playerName: String

        enum CodingKeys: String, CodingKey {
            case playerId = "player_id"
            case playerName = "player_name"
        }
    }

    /// Team object used in Scorer object.
    struct Team: Codable {
        var teamId: Int
        var teamName: String

        enum CodingKeys: String, CodingKey {
            case teamId = "team_id"
            case teamName = "team_name"
        }
    }

    /// Goals data used in Scorer object.
    struct Goals: Codable {
        var overall: Int
        var home: Int
        var away: Int

        enum CodingKeys: String, CodingKey {
            case overall
            case home
            case away
        }
    }
}
