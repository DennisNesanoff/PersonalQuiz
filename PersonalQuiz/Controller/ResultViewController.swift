//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Dennis Nesanoff on 21.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationItem.hidesBackButton = false
    }
    
    private func updateResult() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = responses.map { $0.type }
        
        for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
        }
        
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostsFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        
        updateUI(with: mostsFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultAnswerLabel.text = "You are \(animal.rawValue)!"
        resultDefinitionLabel.text = animal.difinition
    }
}
