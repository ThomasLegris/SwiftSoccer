//
//  homeScorersModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation
import SwiftUI

/// Model for a selected scorer.
struct HomeScorersModel {
    var teamId: Int
    var teamName: String
    var teamIconName: String
    var playerId: Int
    var playerName: String
    var position: String
    var goalsScored: String
    var matchesPlayed: String
    var backgroundColor: Color
    var positionBackgroundColor: Color

    init(teamId: Int,
         teamName: String,
         teamIconName: String,
         playerId: Int,
         playerName: String,
         position: String,
         goalsScored: String,
         matchesPlayed: String,
         backgroundColor: Color = .clear,
         positionBackgroundColor: Color = .clear) {
        self.teamId = teamId
        self.teamName = teamName
        self.teamIconName = teamIconName
        self.playerId = playerId
        self.playerName = playerName
        self.position = position
        self.goalsScored = goalsScored
        self.matchesPlayed = matchesPlayed
        self.backgroundColor = backgroundColor
        self.positionBackgroundColor = positionBackgroundColor
    }
}
