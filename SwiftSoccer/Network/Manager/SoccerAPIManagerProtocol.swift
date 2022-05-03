//
//  SoccerAPIManagerProtocol.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

// MARK: - Protocols
/// Defines the api manager methods.
protocol SoccerAPIManagerProtocol {
    /// Perform the get status request and throw a string corresponding to current account state.
    func statusRequest() async throws -> String

    /// Perform the get al teams request and throw the response.
    func teamsRequest() async throws -> TeamsResponse

    /// Perform request of the list of league scorers and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    func topScorersRequest(league: SoccerLeague) async throws -> ScorersCodable

    /// Perform request of the league standing and throw the response.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    func standingRequest(league: SoccerLeague) async throws -> StandingResponse

    /// Perform request to throw live result.
    ///
    /// - Parameters:
    ///     - league: the targetted league
    ///     - date: current date
    ///     - live: true if live wanted
    ///     - statusCode: optionnal status code about result
    func liveResultRequest(league: SoccerLeague,
                           date: String,
                           live: Bool,
                           statusCode: MatchesStatusCode?) async throws -> MatchesResponse
}
