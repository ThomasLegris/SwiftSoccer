//
//  SoccerLeagues.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

enum SoccerLeague {
    /// League 1 season.
    case ligue1
    /// League 2 season.
    case ligue2

    /// Returns soccer league name.
    var name: String {
        switch self {
        case .ligue1:
            return L10n.seasonLigue1
        case .ligue2:
            return L10n.seasonLigue2
        }
    }

    /// Returns the id of the current season regarding league.
    var seasonId: Int {
        switch self {
        case .ligue1:
            return 2022
        case .ligue2:
            return 456
        }
    }

    /// Returns the id of the targeted league.
    var leagueId: Int {
        switch self {
        case .ligue1:
            return 301
        case .ligue2:
            return 302
        }
    }

    /// Returns country id regarding league.
    var countryId: Int {
        return 46
    }
}
