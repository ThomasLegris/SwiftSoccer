//
//  HomeViewModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// Home screen related viewmodel
final class HomeViewModel: BaseViewModel {
    // MARK: - Init
    override init() {
        super.init()
        self.syncTeams()
    }
}

// MARK: - Internal Funcs
extension HomeViewModel {
    /// Get account status (remaining call).
    // TODO: To add in a futur `setting` screen.
    func getStatus() {
        Task(priority: .medium) {
            let statusResponse = try await apiManager.statusRequest()
            DispatchQueue.main.async {
                // Also use Defaults.appLaunchCounter ?
                // self.status = "Remaining call = \(statusResponse)"
            }
        }
    }

    /// Synchronize team with api and persist the list from server response.
    func syncTeams() {
        Task(priority: .medium) {
            let teamsResponse = try await apiManager.teamsRequest()
            DispatchQueue.main.async {
                PersistanceManager.shared.syncTeams(teams: teamsResponse)
            }
        }
    }
}
