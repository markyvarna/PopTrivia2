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
    
    //Properties
    @IBOutlet var startButton: RoundButtonView!
    @IBOutlet var falseButton: RoundButtonView!
    @IBOutlet var trueButton: RoundButtonView!
    @IBOutlet var progressBar: UIView!
    @IBOutlet var lifeLabel: UILabel!
    @IBOutlet var questionTF: UILabel!
    @IBOutlet var questionCountLabel: UILabel!
    @IBOutlet var progressBarBackGroundView: UIView!
    
    
    //MARK: - Properties
    var questionNumber = 1
    var livesLeft = 3
    var wasRight = false
    var numberOfQuestions = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.falseButton.isHidden = true
        self.trueButton.isHidden = true
        self.progressBar.isHidden = true
        self.lifeLabel.isHidden = true
        self.questionTF.isHidden = true
        self.questionCountLabel.isHidden = true
        self.progressBarBackGroundView.isHidden = true
        
    }
    
    //MARK: Manage Views Func
    func updateProgressHUD () {
        //manage progress bar size
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber+1)
        //manage lives
        if wasRight == false {
            livesLeft -= 1
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
        
        //update questCountLabel
        questionCountLabel.text = "\(questionNumber)/\(numberOfQuestions)"
        
        
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
    }
    @IBAction func falseBP(_ sender: Any) {
        
        
    }
    
    @IBAction func trueBP(_ sender: Any) {
        
        
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
