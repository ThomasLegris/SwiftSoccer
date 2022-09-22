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
    var positionTextColor: Color
    
    init(teamId: Int,
         teamName: String,
         position: String,
         points: String,
         teamIconName: String,
         goalsInOut: String,
         backgroundColor: Color = .clear,
         positionBackgroundColor: Color = .clear,
         positionTextColor: Color) {
        self.teamId = teamId
        self.teamName = teamName
        self.position = position
        self.points = points
        self.teamIconName = teamIconName
        self.goalsInOut = goalsInOut
        self.backgroundColor = backgroundColor
        self.positionBackgroundColor = positionBackgroundColor
        self.positionTextColor = positionTextColor
    }
    
    enum ResultPosition: String {
        case championsLeague = "Champions League"
        case championsLeaguePlayoff = "Champions League Qualification"
        case europaLeague = "UEFA Europa League"
        case europaConferenceLeague = "Conference League Qualification"
        case same
        case relagation = "Relegation"
        case relagationPlayoff = "Relegation Playoff"
        // case for 2nd league level.
        case promotion = "Promotion"
        case promotionPlayoff = "Promotion Playoff"
        
        var color: Color {
            switch self {
            case .championsLeague,
                    .promotion:
                return Color("red50")
            case .championsLeaguePlayoff:
                return Color("red40")
            case .europaLeague,
                    .promotionPlayoff:
                return Color("red30")
            case .europaConferenceLeague:
                return Color("red20")
            case .relagation:
                return Color("gray50")
            case .relagationPlayoff:
                return Color("gray30")
            case .same:
                return .clear
            }
        }
        
        var titleColor: Color {
            switch self {
            case .same:
                return Color("gray80")
            default:
                return .white
            }
        }
    }
}
