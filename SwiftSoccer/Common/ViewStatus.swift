//
//  ViewStatus.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// Provides different status cases.
/// Will be used to display or hide error, loader..
enum ViewStatus {
    case idle
    case loading
    case error
}

// MARK: - Internal Properties
extension ViewStatus {
    /// Status title.
    var title: String {
        switch self {
        case .idle:
            return ""
        case .loading:
            return L10n.commonLoading
        case .error:
            return L10n.commonError
        }
    }
}
