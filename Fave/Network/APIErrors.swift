//
//  APIErrors.swift
//  Fave
//
//  Created by Kola Emiola on 08/06/2020.
//  Copyright © 2020 Kola Emiola. All rights reserved.
//

import Foundation

enum APIErrors: Int, LocalizedError {
    case badRequest = 400
    case unAuthorized = 401
    case tooManyRequests = 429
    case serverError = 500
    
    var errorDescription: String? {
        switch self {
        case .tooManyRequests:
            return "You made too many requests within a window of time and have been rate limited. Back off for a while."
        case .serverError:
            return "Server error."
        default:
            return "Something goes wrong."
        }
    }
}
