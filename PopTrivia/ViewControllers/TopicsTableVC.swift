//
//  TopicsTableVC.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import UIKit

class TopicsTableVC: UITableViewController {
    
    //MOCK DATA
 
    var genre: String?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(genre!)
        print(QuestionController.shared.genreDict[genre!])
    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let genre = genre else {return 0}
        if let topic = QuestionController.shared.genreDict[genre] {
             return topic.count
        } else {
            return 0
        }
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)

        guard let genre = genre else {return UITableViewCell()}
        if let topic = QuestionController.shared.genreDict[genre] {
            cell.textLabel?.text = topic[indexPath.row].name
        }
        

        return cell
    }
   
//     MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuiz" {
            let destinationvc = segue.destination as? QuizVC
            guard let indexPath = tableView.indexPathForSelectedRow?.row,
                let genre = genre else {return}
            if  let topic = QuestionController.shared.genreDict[genre] {
                destinationvc?.questions = topic[indexPath].questions
                print("✅ Questions sent!")
            }
            
        }
    }
    

}
