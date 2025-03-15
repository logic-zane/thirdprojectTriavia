//
//  ForecastViewController.swift
//  Trivia
//
//  Created by 张劲龙 on 3/12/25.
//

import UIKit

class ForecastViewController: UIViewController {
    

    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
        
    var currentQuestionIndex = 0
        var score = 0

        let questions: [TriviaQuestion] = [
            TriviaQuestion(category: "Entertainment: Movie", question: "Who is the best known character in the movie Titanic ", answers: ["Jack Dawson", "Dwayne Johnson", "Steve Roger", "Tony Stark"], correctAnswerIndex: 0),
            TriviaQuestion(category: "Entertainment: Math", question: "What is 12 + 2?", answers: ["13", "14", "25", "33"], correctAnswerIndex: 1),
            TriviaQuestion(category: "Entertainment: Science", question: "What is the largest planet?", answers: ["Earth", "Mars", "Jupiter", "Saturn"], correctAnswerIndex: 2)
        ]

    override func viewDidLoad() {
            super.viewDidLoad()
            answerButton1.tag = 0
            answerButton2.tag = 1
            answerButton3.tag = 2
            answerButton4.tag = 3
            displayQuestion()
        }

        func displayQuestion() {
            let currentQuestion = questions[currentQuestionIndex]

            // Update the UI
            questionNumberLabel.text = "Question \(currentQuestionIndex + 1)/\(questions.count)"
            categoryLabel.text = currentQuestion.category // Update the category label
            questionLabel.text = currentQuestion.question
            answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
            answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
            answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
            answerButton4.setTitle(currentQuestion.answers[3], for: .normal)
        }

        @IBAction func answerButtonTapped(_ sender: UIButton) {
            let currentQuestion = questions[currentQuestionIndex]
            let correctAnswerIndex = currentQuestion.correctAnswerIndex

            if sender.tag == correctAnswerIndex {
                print("Correct!")
                score += 1
            } else {
                print("Wrong!")
            }

            currentQuestionIndex += 1

            if currentQuestionIndex < questions.count {
                displayQuestion()
            } else {
                showScore()
            }
        }

        func showScore() {
            let alert = UIAlertController(
                title: "Quiz Finished!",
                message: "Your score is \(score) out of \(questions.count).",
                preferredStyle: .alert
            )

            let restartAction = UIAlertAction(title: "Restart", style: .default) { _ in
                self.restartQuiz()
            }
            alert.addAction(restartAction)

            present(alert, animated: true, completion: nil)
        }

        func restartQuiz() {
            currentQuestionIndex = 0
            score = 0
            displayQuestion()
        }
    }
