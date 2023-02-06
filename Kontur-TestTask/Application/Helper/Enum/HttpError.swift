//
//  HttpError.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import Foundation

enum HttpError: LocalizedError {
    case invalidURL
    case nonHttpRequest
    case serverError(statusCode: Int)
    case clientError(statusCode: Int)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The specified URL is invalid"
        case .nonHttpRequest:
            return "Non HTTP Request"
        case .serverError(let statusCode):
            return "Server error, status code: \(statusCode)"
        case .clientError(let statusCode):
            return "Client error, status code: \(statusCode)"
        case .networkError(let error):
            return error.localizedDescription
        }
    }
}
