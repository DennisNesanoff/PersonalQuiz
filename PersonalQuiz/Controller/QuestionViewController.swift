//
//  QuestionViewController.swift
//  PersonalQuiz
//
//  Created by Dennis Nesanoff on 21.04.2020.
//  Copyright © 2020 Dennis Nesanoff. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var sinleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    // MARK: - Private properties
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let currentIndex = sinleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangeAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(slider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    // MARK: - Private methods
    // Update user interface
    private func updateUI() {
        // Hide everything
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question
        questionLabel.text = currentQuestion.text
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for questionProgressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Question № \(questionIndex + 1)"
        
        let currentAnswers = currentQuestion.answers
        // Show stack view corresponding to question type
        switch currentQuestion.typeQuestion {
        case .single:
            updateSingleStackView(using: currentAnswers)
        case .multiple:
            updateMultipleStackView(using: currentAnswers)
        case .ranged:
            updateRangeStackView(using: currentAnswers)
        }
    }
    
    
    /// Setup single stack view
    /// - Parameter answers: - array with answer
    ///
    /// - Description: method
    private func updateSingleStackView(using answers: [Answer]) {
        // Show single stack view
        singleStackView.isHidden = false
        
        for (button, answer) in zip(sinleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    
    /// Setup multiple stack view
    /// - Parameter answers: - array with answer
    private func updateMultipleStackView(using answers: [Answer]) {
        // Show single stack view
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    /// Setup range stack view
    /// - Parameter answers: - array with answer
    private func updateRangeStackView(using answers: [Answer]) {
        // Show single stack view
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    // MARK: - Navigation
    // Show next question or go to the next screen
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ResultViewController
        resultVC.responses = answersChosen
    }
}
