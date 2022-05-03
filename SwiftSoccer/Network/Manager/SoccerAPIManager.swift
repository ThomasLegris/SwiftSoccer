//
//  SoccerAPIManager.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Alamofire
import Foundation

/// Manager to handle api call.
final class SoccerAPIManager {
    // MARK: - Internal Properties
    static let shared: SoccerAPIManager = SoccerAPIManager()

    // MARK: - Private Properties
    /// Returns the soccer API Key.
    /// Create one in `https://app.sportdataapi.com/documentation`
    private var apiKey: String {
        return "YOUR_API_KEY" // Could be stored in info.plist.
    }

    // MARK: - Init
    private init() { }
}

// MARK: - Private Enums
private extension SoccerAPIManager {
    /// Provides common constants.
    enum Constants {
        static let keyParam: String = "apikey"
        static let countryIdParam: String = "country_id"
        static let seasonIdParam: String = "season_id"
        static let statusCode: String = "status_code"
        static let dateFrom: String = "date_from"
        static let dateTo: String = "date_to"
    }
}

// MARK: - SoccerAPIManagerProtocol
extension SoccerAPIManager: SoccerAPIManagerProtocol {
    func statusRequest() async throws -> String {
        let params: [String: Any] = [Constants.keyParam: self.apiKey]
        let request = try await self.request(url: SoccerAPI.status.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResponse = try decoder.decode(StatusResponse.self, from: request)
            return jsonResponse.remainingRequests
        } catch let decodeError {
            print(decodeError)
            return "Status error: \(decodeError)"
        }
    }

    func teamsRequest() async throws -> TeamsResponse {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                        Constants.countryIdParam: SoccerLeague.ligue1.countryId]
        let request = try await self.request(url: SoccerAPI.teams.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResonse = try decoder.decode(TeamsResponse.self, from: request)
            return jsonResonse
        } catch let decodeError {
            print("error at teams request \(decodeError)")
            throw decodeError
        }
    }

    func topScorersRequest(league: SoccerLeague) async throws -> ScorersCodable {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                        Constants.seasonIdParam: league.seasonId]
        let request = try await self.request(url: SoccerAPI.topscorers.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResonse = try decoder.decode(ScorersCodable.self, from: request)
            return jsonResonse
        } catch let decodeError {
            print("error at top scorers request \(decodeError)")
            throw decodeError
        }
    }

    func standingRequest(league: SoccerLeague) async throws -> StandingResponse {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.seasonIdParam: league.seasonId]
        let request = try await self.request(url: SoccerAPI.standings.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResponse = try decoder.decode(StandingResponse.self, from: request)
            return jsonResponse
        } catch let decodeError {
            print("error at standings response \(decodeError)")
            throw decodeError
        }
    }

    func liveResultRequest(league: SoccerLeague,
                           date: String,
                           live: Bool = false,
                           statusCode: MatchesStatusCode? = nil) async throws -> MatchesResponse {
        let params: [String: Any] = [Constants.keyParam: self.apiKey,
                                     Constants.seasonIdParam: league.seasonId,
                                     Constants.dateTo: date,
                                     Constants.dateFrom: date,
                                     Constants.statusCode: statusCode?.rawValue ?? 0]
        let request = try await self.request(url: SoccerAPI.matches.url, params: params)

        do {
            let decoder = JSONDecoder()
            let jsonResponse = try decoder.decode(MatchesResponse.self, from: request)
            return jsonResponse
        } catch let decodeError {
            print("error at standings response \(decodeError)")
            throw decodeError
        }
    }
}

// MARK: - Private Funcs
private extension SoccerAPIManager {
    /// Create a common request with custom parameters.
    ///
    /// - Parameters:
    ///     - url: the url to reach
    ///     - params: optionnal parameters to add in request
    ///     - httpMethod: http method for request
    func request(url: URL?,
                 params: [String: Any],
                 httpMethod: HTTPMethod = .get) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            guard let url = url else {
                continuation.resume(throwing: APIError.badUrl)
                return
            }

            AF.request(url,
                       method: httpMethod,
                       parameters: params).validate().responseData { response in
                if let data = response.data {
                    continuation.resume(returning: data)
                    return
                }
                if let err = response.error {
                    continuation.resume(throwing: err)
                    return
                }

                continuation.resume(throwing: APIError.defaultRequestError)
                return
            }
        }
    }
}
