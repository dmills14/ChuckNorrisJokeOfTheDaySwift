//
//  JokeError.swift
//  ChuckNorrisJokeOfTheDaySwift
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

import Foundation

enum JokeError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server. Invalid URL."
            
        case .thrownError(let error):
            return error.localizedDescription
            
        case .noData:
            return "The server responded with no data"
            
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
}//End of enum
