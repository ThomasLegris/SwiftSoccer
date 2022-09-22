//
//  HomeStandingViewModel.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation
import SwiftUI

/// View model in charge of business logic in standing view.
final class HomeStandingViewModel: BaseViewModel {
    // MARK: - Internal Properties
    @Published var rankedTeams: [HomeStandingModel] = []
    var selectedLeague: SoccerLeague = .ligue1
    
    // MARK: - Init
    init(selectedLeague: SoccerLeague) {
        self.selectedLeague = selectedLeague
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
            let standings = try await apiManager.standingRequest(league: selectedLeague)
            DispatchQueue.main.async {
                // map response in a standing model list.
                let standing: [HomeStandingModel] = standings
                    .data
                    .standings
                    .map {
                        var resultDesc: String = ""
                        if let result = $0.result {
                            resultDesc = result
                        } else {
                            resultDesc = $0.status
                        }
                        let position = HomeStandingModel.ResultPosition(rawValue: resultDesc)
                        
                        return HomeStandingModel(teamId: $0.teamId ,
                                                 teamName: self.persistanceManager.teamName(by: $0.teamId),
                                                 position: String($0.position),
                                                 points: String($0.points),
                                                 teamIconName: self.persistanceManager.teamIcon(by: $0.teamId),
                                                 goalsInOut: "\($0.overall.goalsScored):\($0.overall.goalsAgainst)",
                                                 positionBackgroundColor: position?.color ?? .clear,
                                                 positionTextColor: position?.titleColor ?? Color("gray80"))
                    }
                self.rankedTeams = standing
            }
        }
    }
}
