//
//  ErrorFile.swift
//  Boardroom App
//
//  Created by Sara AlQuwaifli on 23/02/2024.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}
