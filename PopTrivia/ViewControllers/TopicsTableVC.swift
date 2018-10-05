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
            
            if topic[indexPath.row].name ==  "Marvel" {
                cell.imageView?.image = UIImage(named: "ironman-1")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 5"
                cell.backgroundColor = UIColor.red
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "DC" {
                cell.imageView?.image = UIImage(named: "superman1")
                cell.imageView?.contentMode = .scaleToFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 7"
                cell.backgroundColor = UIColor.yellow
            } else if topic[indexPath.row].name == "Harry Potter" {
                cell.imageView?.image = UIImage(named: "slytherin")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 6"
                cell.backgroundColor = UIColor.green
            } else if topic[indexPath.row].name == "College Football" {
                cell.imageView?.image = UIImage(named: "college")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 9"
                cell.backgroundColor = UIColor.orange
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "NFL" {
                cell.imageView?.image = UIImage(named: "nfl")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 4"
                cell.backgroundColor = UIColor.purple
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "Animals" {
                cell.imageView?.image = UIImage(named: "giraffe")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 10"
                cell.backgroundColor = UIColor.orange
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "Countries" {
                cell.imageView?.image = UIImage(named: "world")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 10"
                cell.backgroundColor = MVColors.sealBlue()
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "Female Celebrities" {
                cell.imageView?.image = UIImage(named: "female")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 3"
                cell.backgroundColor = UIColor.purple
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "Male Celebrities" {
                cell.imageView?.image = UIImage(named: "male")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 5"
                cell.backgroundColor = UIColor.red
                cell.textLabel?.textColor = UIColor.white
                cell.detailTextLabel?.textColor = UIColor.white
            } else if topic[indexPath.row].name == "Soccer" {
                cell.imageView?.image = UIImage(named: "soccer")
                cell.imageView?.contentMode = .scaleAspectFill
                cell.imageView?.clipsToBounds = true
                cell.detailTextLabel?.text = "Level of Difficulty: 4"
                cell.backgroundColor = UIColor.yellow
            }
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
