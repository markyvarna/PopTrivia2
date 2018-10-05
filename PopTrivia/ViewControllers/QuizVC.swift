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
    
    //MARK: - Properties
    var questions: [Question]?
    var questionNumber = 0
    var livesLeft = 3
    var numberOfQuestions = 10
    var correctAnswer = false
    var userAnswered = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alertImageView.isHidden = true
        self.alertLabel.isHidden = true
        self.alertView.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
        self.falseButton.isHidden = true
        self.trueButton.isHidden = true
        self.progressBar.isHidden = true
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
    }
    
    //MARK: Manage Views Func
    func updateProgressHUD (wasRight: Bool) {
        
        //manage lives
        if questionNumber > 0 {
            if wasRight == false {
                livesLeft -= 1
                progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber+1)
                self.alertImageView.isHidden = false
                self.alertLabel.isHidden = false
                self.alertView.isHidden = false
                self.alertView.layer.borderColor = UIColor.red.cgColor
                self.alertLabel.textColor = UIColor.red
                self.alertLabel.text = "WRONG"
                self.alertImageView.image = UIImage(named: "error")
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                    
                    UIView.animate(withDuration: 0.1, animations: {
                        self.alertImageView.alpha = 1
                        self.alertLabel.alpha = 1
                        self.alertView.alpha = 1
                    }, completion: { (success) in
                        self.alertImageView.isHidden = false
                        self.alertLabel.isHidden = false
                        self.alertView.isHidden = false
                    })
                    UIView.animate(withDuration: 0.9, animations: {
                        self.alertImageView.alpha = 0
                        self.alertLabel.alpha = 0
                        self.alertView.alpha = 0
                    }, completion: { (success) in
                        self.alertImageView.isHidden = true
                        self.alertLabel.isHidden = true
                        self.alertView.isHidden = true
                    })
                }
                
            } else if wasRight == true{
                self.alertImageView.isHidden = false
                self.alertLabel.isHidden = false
                self.alertView.isHidden = false
                self.alertView.layer.borderColor = UIColor.green.cgColor
                self.alertLabel.textColor = UIColor.green
                self.alertLabel.text = "Correct!"
                self.alertImageView.image = UIImage(named: "correct")
                
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (timer) in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.alertImageView.alpha = 1
                        self.alertLabel.alpha = 1
                        self.alertView.alpha = 1
                    }, completion: { (success) in
                        self.alertImageView.isHidden = false
                        self.alertLabel.isHidden = false
                        self.alertView.isHidden = false
                    })
                    UIView.animate(withDuration: 0.9, animations: {
                        self.alertImageView.alpha = 0
                        self.alertLabel.alpha = 0
                        self.alertView.alpha = 0
                    }, completion: { (success) in
                        self.alertImageView.isHidden = true
                        self.alertLabel.isHidden = true
                        self.alertView.isHidden = true
                    })
                }
                
            }
        }
        
        
        if livesLeft == 3 {
            lifeLabel.text = "❤️❤️❤️"
        } else if livesLeft == 2 {
            lifeLabel.text = "❤️❤️"
        } else if livesLeft == 1 {
            lifeLabel.text = "❤️"
        } else {
            lifeLabel.text = "YOU LOSE"
        }
        guard let questions = questions else {return}
        //update questCountLabel
        questionCountLabel.text = "\(questionNumber)/\(questions.count)"
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
            self.alertLabel.text = "Quiz Complete!"
            self.alertImageView.image = UIImage(named: "trophy")
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
                UIView.animate(withDuration: 1, animations: {
                    self.alertImageView.alpha = 1
                    self.alertLabel.alpha = 1
                    self.alertView.alpha = 1
                }, completion: { (success) in
                    self.alertImageView.isHidden = false
                    self.alertLabel.isHidden = false
                    self.alertView.isHidden = false
                    
                })
                self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
    
    
    //MARK: - IBACTIONS
    
    @IBAction func startBP(_ sender: Any) {
        
        self.falseButton.isHidden = false
        self.trueButton.isHidden = false
        self.progressBar.isHidden = false
        self.lifeLabel.isHidden = false
        self.questionTF.isHidden = false
        self.questionCountLabel.isHidden = false
        self.progressBarBackGroundView.isHidden = false
        self.startButton.isHidden = true
        
        //set up first question
        guard let questions = questions else {return}
        questionTF.text = questions[0].questionText
        print(questions[0].questionText)
        
    }
    @IBAction func falseBP(_ sender: Any) {
        userAnswered = false
        self.falseButton.showsTouchWhenHighlighted = true
        guard let questions = questions else {return}
        
        if questionNumber <= questions.count - 1 {
            questionManager()
        } else {
            
            falseButton.isHidden = true
            questionManager()
        }
        
    }
    
    @IBAction func trueBP(_ sender: Any) {
        userAnswered = true
        self.trueButton.showsTouchWhenHighlighted = true
        guard let questions = questions else {return}
        userAnswered = true
        if questionNumber <= questions.count - 1 {
            questionManager()
        } else {
            
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

