//
//  Joke.swift
//  ChuckNorrisJokeOfTheDaySwift
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    let value: Joke
}

struct Joke: Decodable {
    let joke: String
}


