//
//  HomeStandingModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation
import SwiftUI

/// Main model for standing feature.
struct HomeStandingModel {
    var teamId: Int
    var teamName: String
    var position: String
    var points: String
    var teamIconName: String
    var goalsInOut: String
    var backgroundColor: Color
    var positionBackgroundColor: Color

    init(teamId: Int,
         teamName: String,
         position: String,
         points: String,
         teamIconName: String,
         goalsInOut: String,
         backgroundColor: Color = .clear,
         positionBackgroundColor: Color = .clear) {
        self.teamId = teamId
        self.teamName = teamName
        self.position = position
        self.points = points
        self.teamIconName = teamIconName
        self.goalsInOut = goalsInOut
        self.backgroundColor = backgroundColor
        self.positionBackgroundColor = positionBackgroundColor
    }
}
