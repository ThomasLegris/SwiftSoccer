//
//  BaseViewModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// Base view model.
class BaseViewModel: ObservableObject {
    // MARK: - Internal Properties
    /// Common status property which will define the state of view.
    @Published var status: ViewStatus = .idle

    /// Manager for api requests.
    var apiManager: SoccerAPIManagerProtocol = SoccerAPIManager.shared
    /// Manager for database storage.
    var persistanceManager = PersistanceManager.shared
}
