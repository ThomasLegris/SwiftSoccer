//
//  HomePageModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

// MARK: - Protocols
/// Defines a protocol to handle page type.
protocol HomePageProtocol {
    var pageType: HomePageType { get }
}

// MARK: - Enums
/// Stores each home page type.
enum HomePageType: String, CaseIterable {
    case standing
    case scorers
    case liveResult

    /// Return title of selected home page.
    var title: String {
        switch self {
        case .liveResult:
            return L10n.homeLiveResults
        case .standing:
            return L10n.homeRanking
        case .scorers:
            return L10n.homeScorers
        }
    }

    /// Return Image of page type.
    var imageName: String {
        switch self {
        case .liveResult:
            return Asset.icCalendar.name
        case .standing:
            return Asset.icStanding.name
        case .scorers:
            return Asset.icScorers.name
        }
    }
}
