//
//  TeamsParser.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

/// Codable response for teams request.
struct TeamsResponse: Codable {
    var data: [TeamData]
    var query: TeamQuery

    enum CodingKeys: String, CodingKey {
        case data
        case query
    }
}

// MARK: - Models
extension TeamsResponse {
    /// `data` field in API teams response.
    struct TeamData: Codable {
        var teamId: Int
        var name: String
        var shortCode: String
        var logo: String

        enum CodingKeys: String, CodingKey {
            case teamId = "team_id"
            case name
            case shortCode = "short_code"
            case logo
        }
    }

    /// `query` field in API teams response.
    struct TeamQuery: Codable {
        var countryId: String

        enum CodingKeys: String, CodingKey {
            case countryId = "country_id"
        }
    }
}
