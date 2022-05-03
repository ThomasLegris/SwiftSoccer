//
//  HomeScorersViewModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// Handles data about scorers list.
class HomeScorersViewModel: BaseViewModel {
    // MARK: - Internal Properties
    @Published var topScorers: [HomeScorersModel] = []

    // MARK: - Init
    override init() {
        super.init()

        initScorers()
    }
}

// MARK: - Private Funcs
private extension HomeScorersViewModel {
    /// Inits data source of scorers.
    func initScorers() {
        Task(priority: .medium) {
            let topScorers = try await apiManager.topScorersRequest(league: .ligue1)
            // When request received (due to await operator), parse it into a array of scorers model.
            DispatchQueue.main.async {
                let scorers = topScorers.data.map {
                    HomeScorersModel(teamId: $0.team.teamId,
                                     teamName: $0.team.teamName,
                                     teamIconName: self.persistanceManager.teamIcon(by: $0.team.teamId),
                                     playerId: $0.player.playerId,
                                     playerName: $0.player.playerName,
                                     position: String($0.pos),
                                     goalsScored: String($0.goals.overall),
                                     matchesPlayed: String($0.matchesPlayed))
                }
                self.topScorers = scorers
            }
        }
    }
}
