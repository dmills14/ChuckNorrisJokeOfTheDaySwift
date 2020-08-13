//
//  JokeController.swift
//  ChuckNorrisJokeOfTheDaySwift
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

import Foundation

class JokeController {
    
    static func fetchNewJoke(completion: @escaping (Result<Joke, JokeError >) -> Void) {
        
        guard let jokeURL = URL(string: "https://api.icndb.com/jokes/random") else { return completion(.failure(.invalidURL))}
        print(jokeURL)
        
        URLSession.shared.dataTask(with: jokeURL) { ( data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let joke = topLevelObject.value
                return completion(.success(joke))
            } catch {
                print("Do try catch error.")
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
}//end of class
