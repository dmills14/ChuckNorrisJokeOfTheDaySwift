//
//  JokeViewController.swift
//  ChuckNorrisJokeOfTheDaySwift
//
//  Created by Drew Miller on 8/13/20.
//  Copyright © 2020 DevMtn. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var jokeLabel: UILabel!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Private Methods
    private func updateJoke() {
        
        JokeController.fetchNewJoke { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let joke):
                    self?.jokeLabel.text = joke.joke
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    //MARK: - Actions
    @IBAction func fetchJokeButtonTapped(_ sender: Any) {
        updateJoke()
    }
    


}//end of class
