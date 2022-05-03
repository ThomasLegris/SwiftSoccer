//
//  HomeStandingViewModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// View model in charge of business logic in standing view.
final class HomeStandingViewModel: BaseViewModel {
    // MARK: - Internal Properties
    @Published var rankedTeams: [HomeStandingModel] = []

    // MARK: - Init
    override init() {
        super.init()

        initDataSource()
    }
}

// MARK: - Private Funcs
private extension HomeStandingViewModel {
    /// Inits the ranked teams list with api call.
    func initDataSource() {
        // Init an async task and perform api request.
        Task(priority: .medium) {
            let standings = try await apiManager.standingRequest(league: .ligue1)
            DispatchQueue.main.async {
                // map response in a standing model list.
                let standing: [HomeStandingModel] = standings
                    .data
                    .standings
                    .map {
                        HomeStandingModel(teamId: $0.teamId ,
                                          teamName: self.persistanceManager.teamName(by: $0.teamId),
                                          position: String($0.position),
                                          points: String($0.points),
                                          teamIconName: self.persistanceManager.teamIcon(by: $0.teamId),
                                          goalsInOut: "\($0.overall.goalsScored):\($0.overall.goalsAgainst)" )
                    }
                self.rankedTeams = standing
            }
        }
    }
}
