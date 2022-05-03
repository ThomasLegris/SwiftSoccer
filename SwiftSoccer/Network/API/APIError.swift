//
//  ApiError.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import Foundation

/// Model for api error.
enum APIError: Error {
    case badUrl
    case jsonParsingError
    case defaultRequestError
}
