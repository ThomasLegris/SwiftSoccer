//
//  CommonParser.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

struct StatusResponse: Codable {
    var remainingRequests: String

    enum CodingKeys: String, CodingKey {
        case remainingRequests = "remaining_requests"
    }
}
