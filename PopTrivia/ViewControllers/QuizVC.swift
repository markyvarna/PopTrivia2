//
//  QuizVC.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    //Outlets
    @IBOutlet var startButton: RoundButtonView!
    @IBOutlet var falseButton: RoundButtonView!
    @IBOutlet var trueButton: RoundButtonView!
    @IBOutlet var progressBar: UIView!
    @IBOutlet var lifeLabel: UILabel!
    @IBOutlet var questionTF: UILabel!
    @IBOutlet var questionCountLabel: UILabel!
    @IBOutlet var progressBarBackGroundView: UIView!
    @IBOutlet var alertLabel: UILabel!
    @IBOutlet var alertImageView: UIImageView!
    @IBOutlet var alertView: AlertView!
    
    @IBOutlet var progBackground: UIView!
    //MARK: - Properties
    var questions: [Question]?
    var questionNumber = 0
    var questionsCorrectlyAnswered = 0
    var incorrectAnswerCount = 0
    var livesLeft = 3
    var numberOfQuestions = 10
    var correctAnswer = false
    var userAnswered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressBarBackGroundView.isHidden = true
        self.progressBarBackGroundView.backgroundColor = .white
        progBackground.isHidden = true
        progBackground.backgroundColor = .white
        self.alertImageView.isHidden = true
        self.alertLabel.isHidden = true
        self.alertView.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        self.falseButton.isHidden = true
        self.trueButton.isHidden = true
        self.progressBar.isHidden = true
        self.progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(questionsCorrectlyAnswered)
        self.lifeLabel.isHidden = true
        self.questionTF.isHidden = true
        self.questionCountLabel.isHidden = true
        self.progressBarBackGroundView.isHidden = true
        guard let questions = questions else {return}
        print(questions[0].questionText)
        self.alertImageView.alpha = 0
        self.alertLabel.alpha = 0
        self.alertView.alpha = 0
        print("\(questions.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questionManager()
        progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(questionsCorrectlyAnswered)
        updateViews()
    }
    
    //MARK: Manage Views Func
    func updateProgressHUD (wasRight: Bool) {
        
        guard let questions = questions else {return}
        //manage lives
        if questionNumber > 0 {
            if wasRight == !correctAnswer {
                livesLeft -= 1

                self.alertImageView.isHidden = false
                self.alertLabel.isHidden = false
                self.alertView.isHidden = false
                self.alertView.layer.borderColor = UIColor.red.cgColor
                self.alertLabel.textColor = UIColor.red
                self.alertLabel.text = "WRONG"
                self.alertImageView.image = UIImage(named: "error")

                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                    
                    UIView.animate(withDuration: 1.2, animations: {
                        
                        self.alertImageView.alpha = 1
                        self.alertLabel.alpha = 1
                        self.alertView.alpha = 1
                        
                    }, completion: { (success) in
                        
                        self.updateProgressBar(num: 0)
                        self.alertImageView.alpha = 0
                        self.alertLabel.alpha = 0
                        self.alertView.alpha = 0
                        self.alertImageView.isHidden = true
                        self.alertLabel.isHidden = true
                        self.alertView.isHidden = true
                        
                    })
                    UIView.animate(withDuration: 0.0, animations: {

                    }, completion: { (success) in
                        
                        self.updateProgressBar(num: 0)

                    })
                }
                
            } else if wasRight == correctAnswer {

                self.alertImageView.isHidden = false
                self.alertLabel.isHidden = false
                self.alertView.isHidden = false
                self.alertView.layer.borderColor = UIColor.green.cgColor
                self.alertLabel.textColor = UIColor.green
                self.alertLabel.text = "Correct!"
                self.alertImageView.image = UIImage(named: "correct")

                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                    UIView.animate(withDuration: 1.2, animations: {

                        self.alertImageView.alpha = 1
                        self.alertLabel.alpha = 1
                        self.alertView.alpha = 1
                    }, completion: { (success) in
                        self.updateProgressBar(num: 0)
                        self.alertImageView.alpha = 0
                        self.alertLabel.alpha = 0
                        self.alertView.alpha = 0
                        self.alertImageView.isHidden = true
                        self.alertLabel.isHidden = true
                        self.alertView.isHidden = true
                    })
                    UIView.animate(withDuration: 0.0, animations: {

                    }, completion: { (success) in
                        self.updateProgressBar(num: 1)

                    })
                }
                
            }
        }
        
        questionCountLabel.text = "\(questionNumber)/\(questions.count)"
        
        if livesLeft == 3 {
            lifeLabel.text = "❤️❤️❤️"
        } else if livesLeft == 2 {
            lifeLabel.text = "❤️❤️"
        } else if livesLeft == 1 {
            lifeLabel.text = "❤️"
        } else {

            self.alertImageView.isHidden = false
            self.alertLabel.isHidden = false
            self.alertView.isHidden = false
            self.alertView.layer.borderColor = UIColor.red.cgColor
            self.alertLabel.textColor = UIColor.red
            self.alertLabel.text = "You Lose"
            self.alertImageView.image = UIImage(named: "dead")
            
            lifeLabel.text = "☠︎☠︎☠︎"
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                self.alertImageView.isHidden = false
                UIView.animate(withDuration: 0.5, animations: {


                    self.view.backgroundColor = UIColor.red
                    self.alertView.alpha = 0
                    self.alertImageView.alpha = 0
                    self.alertLabel.alpha = 0
                    self.alertImageView.isHidden = false
                    self.alertView.isHidden = false
                    self.alertLabel.isHidden = false

                }, completion: { (success) in

                    self.alertView.alpha = 1
                    self.alertImageView.alpha = 1
                    self.alertLabel.alpha = 1
                    self.alertImageView.isHidden = true
                    self.alertView.isHidden = true
                    self.alertLabel.isHidden = true

                })
                
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
    
    
    func questionManager() {
        
        
        guard let questions = questions else {return}
        if questionNumber - 1 < questions.count - 1 {
            updateProgressHUD(wasRight: userAnswered)
            numberOfQuestions = questions.count
            questionNumber += 1
            correctAnswer = questions[questionNumber - 1].correctAnswer
            if questionNumber > 0 {
                
                questionTF.text = questions[questionNumber - 1].questionText
                
            }
        } else {
            updateProgressHUD(wasRight: userAnswered)

            self.alertImageView.isHidden = false
            self.alertLabel.isHidden = false
            self.alertView.isHidden = false
            self.alertView.layer.borderColor = MVColors.sealBlueDark().cgColor
            self.alertLabel.textColor = MVColors.sealBlue()
            self.alertLabel.text = "You Won"
            self.alertImageView.image = UIImage(named: "trophy")
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (timer) in
                self.alertImageView.isHidden = false
                UIView.animate(withDuration: 5, animations: {
                    self.alertImageView.isHidden = true
                    self.alertLabel.isHidden = true
                    self.alertView.isHidden = true
                    self.alertView.alpha = 0
                    self.alertImageView.alpha = 0
                    self.alertLabel.alpha = 0
                    
                }, completion: { (success) in
                    
                    self.alertView.alpha = 1
                    self.alertImageView.alpha = 1
                    self.alertLabel.alpha = 1
                    self.alertLabel.isHidden = false
                    self.alertView.isHidden = false
                    self.alertImageView.isHidden = false
                    
                })
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
    func updateProgressBar(num: Int) {
        
        if num == 0 {
            incorrectAnswerCount = questionsCorrectlyAnswered

            print("🍑 \(incorrectAnswerCount)")
            progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(incorrectAnswerCount)
        } else if num == 1 {
            print("🍟 \(questionsCorrectlyAnswered)")
            questionsCorrectlyAnswered += 1
            
            progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(questionsCorrectlyAnswered)
        } else {
             progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(questionsCorrectlyAnswered-1)
        }
        
        
    }
    
    func updateViews() {
        self.progressBarBackGroundView.backgroundColor = UIColor.white
    }
    //MARK: - IBACTIONS
    
    @IBAction func startBP(_ sender: Any) {
        updateViews()
        progBackground.isHidden = false
        
        self.progressBarBackGroundView.isHidden = false
        self.falseButton.isHidden = false
        self.trueButton.isHidden = false
        self.progressBar.isHidden = false
        self.progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(questionsCorrectlyAnswered)
        self.lifeLabel.isHidden = false
        self.questionTF.isHidden = false
        self.questionCountLabel.isHidden = false
        self.startButton.isHidden = true
        
        //set up first question
        guard let questions = questions else {return}
        questionTF.text = questions[0].questionText
        print(questions[0].questionText)
        
    }
    @IBAction func falseBP(_ sender: Any) {
        userAnswered = false
        self.progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(incorrectAnswerCount)
        self.falseButton.showsTouchWhenHighlighted = true
        guard let questions = questions else {return}
        
        if questionNumber <= questions.count - 1 {
            questionManager()
        } else {
            trueButton.isHidden = true
            falseButton.isHidden = true
            questionManager()
        }
        
    }
    
    @IBAction func trueBP(_ sender: Any) {
        userAnswered = true
        self.progressBar.frame.size.width = (view.frame.size.width/10) * CGFloat(incorrectAnswerCount)
        self.trueButton.showsTouchWhenHighlighted = true
        guard let questions = questions else {return}
        userAnswered = true
        if questionNumber <= questions.count - 1 {
            questionManager()
        } else {
            falseButton.isHidden = true
            trueButton.isHidden = true
            questionManager()
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

